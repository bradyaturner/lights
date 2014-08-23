Feature: Hue
  
  Scenario: List Hue bulbs
    When I run `hue list`
    Then the output should contain "[1]"
