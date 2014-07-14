Feature: Chat Room

  As a learner
  So that I can discuss with other learners
  I need a chat room

Scenario: I am in the chat room by myself
  Given I am in a chatroom
  Then I should see "learner 1 join the room"
  And I should see "you joined as learner 1"

  Then I fill in "from 1" for "input-text"
  And I press "send"
  Then I should see "student 1 : from 1"