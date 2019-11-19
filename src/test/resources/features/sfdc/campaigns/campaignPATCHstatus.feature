Feature: Campaigns

  Background:
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/Campaign" with json body
    """
    {
    "Name": "Campaign0002 created by cucumber"
    }
    """
    And I save the response as "C"

  Scenario: PATCH Campaigns
    When I send a "PATCH" request to "/sobjects/Campaign/{C.id}" with json body
    """
    {
    "Status": "In Progress"
    }
    """
    Then I validate the response has status code 204
    And I send a "DELETE" request to "/sobjects/Campaign/{C.id}"
    And I validate the response has status code 204