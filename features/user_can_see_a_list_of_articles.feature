Feature: List aricles on index page

    "As a visitor
    When I visit the application
  I would like to see a list of articles"

  Background:
    Given the following articles exist:
      | title                   | 
      | A breaking News Article | 
      | Some other news         | 

  Scenario: Viewing a list of articles
    When I am on the index page
    Then I should see "A breaking News Article"
    And I should see "Some other news"

