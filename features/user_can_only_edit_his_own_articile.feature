Feature: title
  In order to value
  As a role
  I want feature


  Background:
    Given the following users exist
      | email           |
      | thomas@craft.se |
      | oliver@craft.se |

    And the following articles exist
      | title      | author          |
      | Big news   | thomas@craft.se |
      | Small news | oliver@craft.se |

    And I am logged in as "thomas@craft.se"
    And I am on the index page

  Scenario: User can edit his own article
    And I click on "Big news"
    And I click on "Edit"
    Then I should be on the edit page for "Big news"


  Scenario: User can NOT edit another users article
    And I click on "Small news"
    And I click on "Edit"
    Then I should see "You are not authorized to do that"