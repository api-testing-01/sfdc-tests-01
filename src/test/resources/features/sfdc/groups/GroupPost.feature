Feature: Groups Post

  @cleanData
  Scenario: Create group with only name
    Given I use the "sfdc" service and the "admin" account
    When I send a "POST" request to "/sobjects/Group" with json body
    """
    {
    "Name": "Creating a new group"
    }
    """
    And I save the response as "g"
    And I save the request endpoint for deleting
    Then I validate the response has status code 201

  @cleanData
  Scenario: Create group with only name
    Given I use the "sfdc" service and the "admin" account
    When I send a "POST" request to "/sobjects/Group" with json body
    """
    {
    "Name": "Creating a new group",
    "DoesSendEmailToMembers": "true",
    "DoesIncludeBosses": "false"
    }
    """
    And I save the response as "g"
    And I save the request endpoint for deleting
    Then I validate the response has status code 201

  @cleanData
  Scenario: Create group without name
    Given I use the "sfdc" service and the "admin" account
    When I send a "POST" request to "/sobjects/Group" with json body
    """
    {
    "Name": ""
    }
    """
    And I save the response as "g"
    And I save the request endpoint for deleting
    Then I validate the response has status code 400