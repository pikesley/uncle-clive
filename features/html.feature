@html
Feature: view HTML pages

  Scenario: Get the home page
    Given I am on "the home page"
    Then I should see "Uncle Clive"
    And I should see "Sinclair Spectrum Font as a Service"
    And I should see "Content negotiation"
    And I should not see "It's running at"

  Scenario: Get a single character
    When I go to "/a"
    Then I should see "table" inside ".hero-unit"
    And "title" should not be "Nothing to see here"
