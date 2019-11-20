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

  @cleanData
  Scenario: Search for an existing group
    When I send a "GET" request to "/sobjects/Group/{g.id}"
    Then I validate the response has status code 200

  Scenario: Search for a non existing group
    When I send a "GET" request to "/sobjects/Group/0"
    Then I validate the response has status code 404
    And I send a "DELETE" request to "/sobjects/Group/{g.id}"
    And I validate the response has status code 204

  Scenario: Search for a non existing group
    When I send a "GET" request to "/sobjects/Group/00G4P000003yfhoUAA"
    Then I validate the response has status code 404
    And I send a "DELETE" request to "/sobjects/Group/{g.id}"
    And I validate the response has status code 204