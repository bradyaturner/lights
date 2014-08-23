Feature: Hue
  
  Scenario: List Default
    When I run `hue list`
    Then the output should contain "[1]"

  Scenario: List Hue bulbs
    When I run `hue list lights`
    Then the output should contain "[1]"

  Scenario: List Hue groups
    When I run `hue list groups`
    Then the output should contain "[1]"

  Scenario: List Hue sensors
    When I run `hue list sensors`
    Then the output should contain "[1]"
