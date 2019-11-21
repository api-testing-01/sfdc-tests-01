Feature: Groups Get

  Background: Login user
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/Group" with json body
    """
    {
    "Name": "Group RPFH 01"
    }
    """
    And I save the response as "g"
    And I save the request endpoint for deleting

  @cleanData
  Scenario: Search for an existing group
    When I send a "GET" request to "/sobjects/Group/{g.id}"
    Then I validate the response has status code 200

  @cleanData
  Scenario: Search for a non existing group
    When I send a "GET" request to "/sobjects/Group/0"
    Then I validate the response has status code 404

  @cleanData
  Scenario: Search for a non existing group
    When I send a "GET" request to "/sobjects/Group/00G4P000003yfhoUAA"
    Then I validate the response has status code 404