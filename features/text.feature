@text
Feature: get text

  Scenario: Get text block for single character
    When I go to "/a"
    Then the response should be a text block:
    """

      [][][]
            []
      [][][][]
    []      []
      [][][][]
    """

  Scenario: Get JSON for longer string
    When I go to "/1982"
    Then the response should be a text block:
    """
      [][]          [][][][]        [][][][]        [][][][]
    []  []        []        []    []        []    []        []
        []        []        []      [][][][]                []
        []          [][][][][]    []        []      [][][][]
        []                  []    []        []    []
    [][][][][]      [][][][]        [][][][]      [][][][][][]
    """

  Scenario: Handle embedded spaces correctly
    When I go to "/a b c"
    Then the response should be a text block:
    """
                                      []
      [][][]                          []                                [][][]
            []                        [][][][]                        []
      [][][][]                        []      []                      []
    []      []                        []      []                      []
      [][][][]                        [][][][]                          [][][]
    """