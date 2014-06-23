Given /^an activity schema "(.*?)"$/ do |name|
  @activity_schema1 = create(:activity_schema, :name => name)
end

Given(/^I start on the Edit Page for activity_schema$/) do |loc|
	visit edit_activity_schema_path(@activity_schema1)
end