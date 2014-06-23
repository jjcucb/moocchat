Feature: update activity schema as Administrator

  As an Administrator
  So that I update the name of my condition
  I want to edit a condition

Background:

  Given a condition "cond1"

Scenario: edit page, valid conditions, Administrator

  I start on the Edit Page for condition
  And I fill in "new_name" for "condition_name"
  And I press "Update Condition"
  Then I should see "new_name" 