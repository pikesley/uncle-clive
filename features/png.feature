@png
Feature: view generated PNG images

  Scenario: Get a single character
    When I go to "/a"
    Then the response should be a PNG
