Feature: List aricles on index page

    "As a visitor
    When I visit the application
  I would like to see a list of articles"

  Background:
    Given the following articles exist:
      | title                   | content                |
      | A breaking News Article | Some important content |
      | Some other news         | Some other content     |
      
  Scenario: Viewing a list of articles
    When I am on the index page
    Then I should see "A breaking News Article"
    And I should see "Some other news"

