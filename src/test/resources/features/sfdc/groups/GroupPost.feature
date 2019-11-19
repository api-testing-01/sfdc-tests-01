Feature: Groups Post

  Background:
    Given I use the "sfdc" service and the "admin" account


  @cleanData
  Scenario: Create group with only name
    When I send a "POST" request to "/sobjects/Group" with json body
    """
    {
    "Name": "Creating a new group"
    }
    """
    And I save the response as "g"
    Then I validate the response has status code 201

  @cleanData
  Scenario: Create group with only name
    When I send a "POST" request to "/sobjects/Group" with json body
    """
    {
    "Name": "Creating a new group",
    "DeveloperName": "Rosario",
    "DoesIncludeBosses": "false"
    }
    """
    And I save the response as "g"
    Then I validate the response has status code 201