Feature: User can create articles
  As a publisher
  In order to add relevant content to my news service
  I would like to be able to create articles



  Scenario: Non logged in user receives an error message
    Given I am on the index page
    And I click on "New Article"
    Then I should see "You need to sign in or sign up before continuing"
    And I should be on the login page 

  Scenario: Successfully creates an article
    Given I am logged in as "thomas@craft.com"
    And I am on the index page
    And I click on "New Article"
    When I fill in "Title" with "Happy holidays"
    And I fill in "Content" with "Buy your gifts now!"
    And I click on "Create Article"
    Then I should be on the "Happy holidays" page
    And I should see "Article was successfully created."
    And I should see "Happy holidays"
    And I should see "Buy your gifts now!"