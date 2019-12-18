Feature: Feature name

  Feature Description


  Background:
    Given the following users exist
      | email           | subscriber |
      | thomas@craft.se | true       |
      | oliver@craft.se | false      |

    And the following articles exist
      | title      | author          |
      | Big news   | thomas@craft.se |
      | Small news | thomas@craft.se |

  Scenario: Not logged in user can NOT access article content
    Given I am on the index page
    And I click on "Big news"
    Then I should see "You have to purchase a subscrition to read this article"


  Scenario: Subscriber can access article content
    Given I am logged in as "thomas@craft.se"
    And I am on the index page
    And I click on "Big news"
    Then I should not see "You have to purchase a subscrition to read this article"
    Then I should be on the "Big news" page

  Scenario: Registered user (non-subscriber) can NOT access article content
    Given I am logged in as "oliver@craft.se"
    And I am on the index page
    And I click on "Big news"
    Then I should see "You have to purchase a subscrition to read this article"