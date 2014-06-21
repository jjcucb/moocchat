require 'spec_helper'

describe WaitingRoom do
  describe 'adding task' do
    before :each do ; @t = create(:task) ; end
    it 'creates waiting room when doesn\'t exist for this activity/condition' do
      expect { WaitingRoom.add(@t) }.to change { WaitingRoom.count }.by 1
    end
    it 'does not create waiting room if it exists' do
      create :waiting_room, :activity_schema => @t.activity_schema, :condition => @t.condition
      expect { WaitingRoom.add(@t) }.not_to change { WaitingRoom.count }
    end
    it 'raises exception if same task added >1 time' do
      WaitingRoom.add @t
      expect { WaitingRoom.add @t }.to raise_error(WaitingRoom::TaskAlreadyWaitingError)
    end
  end
  describe 'processing' do
    # how to test transactional integrity, since we have to atomically
    # empty the waiting room and assign tasks to groups?
    before :each do
      @condition = create :condition
      @activity = create :activity_schema
    end
    # test cases:
    # q length, pref'd grp size, min grp size, expected #grps, expected #small grps, expected # rejects
    @tests = [
      [6, 2, 1, 3, 0, 0],
      [7, 2, 1, 3, 1, 0],
      [5, 4, 2, 1, 0, 1],
      [3, 5, 3, 0, 1, 0],
      [3, 5, 2, 0, 1, 1],
      [3, 5, 4, 0, 0, 3],
    ]
    @tests.each do |test_case|
      len,size,min_size,num_groups,num_small,num_rejects = test_case
      describe "Split #{len} learners into groups of #{size} and small-groups of #{min_size}" do
        before :each do
          @condition.update_attributes(:preferred_group_size => size, :minimum_group_size => min_size)
          len.times { WaitingRoom.add(create(:task, :condition => @condition, :activity_schema => @activity)) }
          @w = WaitingRoom.find_by_activity_schema_id_and_condition_id!(@condition.id, @activity.id)
          @w.process
          @groups = Task.group('chat_group')
        end
        it "should create #{num_groups} large groups" do
          @groups.having("COUNT(*)=#{size}").length.should == num_groups
        end
        it "should create #{num_small} small groups" do
          @groups.having("COUNT(*)=#{min_size}").length.should == num_small
        end
        it "should have #{num_rejects} rejects" do
          Task.where('chat_group = "NONE"').count.should == num_rejects
        end
        it "should empty the waiting room" do
          @w.tasks.length.should == 0
        end
      end
    end
  end

end
