# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140611000809) do

  create_table "activity_schemas", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "cohort_id"
    t.boolean  "enabled"
    t.boolean  "randomized"
    t.integer  "num_questions"
    t.string   "tag"
    t.string   "name"
  end

  create_table "cohorts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "cohorts_instructors", :id => false, :force => true do |t|
    t.integer "cohorts_id"
    t.integer "instructors_id"
  end

  create_table "cohorts_learners", :id => false, :force => true do |t|
    t.integer "cohorts_id"
    t.integer "learners_id"
  end

  create_table "conditions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.text     "prologue"
    t.text     "body"
    t.text     "epilogue"
  end

  create_table "questions", :force => true do |t|
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.text     "text"
    t.text     "answers"
    t.integer  "correct_answer_index"
  end

  create_table "tasks", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "activity_id"
    t.integer  "learner_id"
    t.integer  "condition_id"
    t.string   "chat_group"
    t.integer  "current_question"
    t.boolean  "completed"
  end

  create_table "templates", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "url"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
    t.string   "name"
  end

end
