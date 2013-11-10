Feature: view pages

  Scenario: Get ipsum
    When I go to "/a"
    Then I should see JSON: