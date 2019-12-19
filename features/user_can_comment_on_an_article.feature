Feature: User can comment on an article
  As a user
  In order to voice my opinions
  I would like to be able to comment on an article

  Background:
    Given the following users exist
      | email            | subscriber |
      | thomas@craft.com | true       |

    And the following articles exist:
      | title                   |
      | A breaking News Article |
      | Some other news         |
    And I am logged in as "thomas@craft.com"
    And I am on the index page

  Scenario: User can comment successfully
    When I click on "A breaking News Article"
    And I fill in "Comment" with "This is fake news!!!!"
    And I click on "Submit comment"
    Then I should see "Your comment was successfully submited"
    And I should be at "A breaking News Article" page
    And I should see "This is fake news!!!!"

  Scenario: User can not leave empty comment
    When I click on "A breaking News Article"
    And I fill in "Comment" with ""
    And I click on "Submit comment"
    Then I should see "Something went wrong"
    And I should be at "A breaking News Article" page
