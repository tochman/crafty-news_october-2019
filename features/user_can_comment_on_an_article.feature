Feature: User can comment on an article
  As a user
  In order to voice my opinions
  I would like to be able to comment on an article

  Background:
    Given the following articles exist:
      | title                   | 
      | A breaking News Article | 
      | Some other news         | 

    And I am on the index page

  Scenario: User can comment successfully
    When I click on "A breaking News Article"
    And I fill in "Comment" with "This is fake news!!!!"
    And I click on "Submit comment"
    Then I should see "Commented"
    And I should be at "A breaking News Article" page
    And I should see "This is fake news!!!!"