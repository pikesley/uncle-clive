@html
Feature: view HTML pages

  Scenario: Get the home page
    Given I am on "the home page"
    Then I should see "Nothing to see here"
    And I should see "Try adding some text onto the end of the URL"

  Scenario: Get a single character
    Given I request HTML
    When I go to "/a"
    Then the response should be JSON:
    """
  {
  "id": "a",
  "data": [
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 1, 0, 0],
  [0, 0, 1, 1, 1, 1, 0, 0],
  [0, 1, 0, 0, 0, 1, 0, 0],
  [0, 0, 1, 1, 1, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0]
  ]
  }
  """