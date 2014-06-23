Feature: create activity schema as Administrator

  As an Administrator
  So that I see the name of my activity schema
  I want to create an activity schema

  Scenario: Create a activity schema, valid conditions
  Given I am on the activity_schemas page
  When I follow "New"
  Then I should see "Name"
  When I fill in "1" for "activity_schema_cohort_id"
  And I fill in "3" for "activity_schema_num_questions"
  And I fill in "now" for "activity_schema_tag"
  And I fill in "example" for "activity_schema_name"
  And I fill in "2" for "activity_schema_starts_every"
  And I press "Create Activity schema"
  Then I should see "example"
  When I follow "Back"
  When I follow "1"
  Then I should see "example"

