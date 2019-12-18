Feature: Feature name

  Feature Description


  Background:
    Given the following users exist
      | email           | subscriber |
      | thomas@craft.se | false      |

    And the following articles exist
      | title    | author          |
      | Big news | thomas@craft.se |


  Scenario: User can "purchase" a subscription
    Given I am logged in as "thomas@craft.se"
    And I am on the index page
    And I click on "Big news"
    Then I should be on the purchase subscription page
    And I click on "Subscribe!"
    Then I should be on the "Big news" page
    And I should see "Thank you for becoming a subscriber"