@html
Feature: view HTML pages

  Scenario: Get the home page
    Given I am on "the home page"
    Then I should see "Uncle Clive"

#  Scenario: Get a single character
#    When I go to "/a"
#    Then I should see "table" inside "#sinclair"
