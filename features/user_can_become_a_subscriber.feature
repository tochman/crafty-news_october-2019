@javascript
Feature: Feature name

  Feature Description


  Background:
    Given the following users exist
      | email           | subscriber |
      | thomas@craft.se | false      |
      | author@craft.se | false      |

    And the following articles exist
      | title    | author          |
      | Big news | author@craft.se |


  Scenario: User can "purchase" a subscription
    Given I am logged in as "thomas@craft.se"
    And I am on the index page
    And I click on "Big news"
    Then wait 2 seconds
    And I fill in the Stripe form field "Card Number" with "4242424242424242"
    And I fill in the Stripe form field "Expiry date" with "1220"
    And I fill in the Stripe form field "CVC" with "123"
    And I click on "Subscribe!"
    Then wait 1 seconds
    Then I should be on the "Big news" page
    And I should see "Thank you for becoming a subscriber"