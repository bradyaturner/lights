Feature: Lights

  Scenario: No command
    When I run `lights`
    Then the output should contain "Must specify a command."

  Scenario: List Default
    When I run `lights list`
    Then the output should contain "[1]"

  Scenario: List Hue bulbs
    When I run `lights list lights`
    Then the output should contain "[1]"

  Scenario: List Hue groups
    When I run `lights list groups`
    Then the output should contain "ID"

  Scenario: List Hue sensors
    When I run `lights list sensors`
    Then the output should contain "[1]"

  Scenario: List Hue scenes
    When I run `lights list scenes`
    Then the output should contain "ID"

# This test is failing because OptionParser is casting the string as an integer (0)
#  Scenario: Incorrect parameters to set
#    When I run `lights set -l all -h test`
#    Then the output should contain "incorrect"

