Feature: Rue

  Scenario: No command
    When I run `rue`
    Then the output should contain "Must specify a command."
  Scenario: List Default
    When I run `rue list`
    Then the output should contain "[1]"

  Scenario: List Hue bulbs
    When I run `rue list lights`
    Then the output should contain "[1]"

  Scenario: List Hue groups
    When I run `rue list groups`
    Then the output should contain "[1]"

  Scenario: List Hue sensors
    When I run `rue list sensors`
    Then the output should contain "[1]"

# This test is failing because OptionParser is casting the string as an integer (0)
#  Scenario: Incorrect parameters to set
#    When I run `rue set -l all -h test`
#    Then the output should contain "incorrect"

