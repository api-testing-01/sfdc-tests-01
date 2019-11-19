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
    And I save the request endpoint for deleting

  @cleanData
  Scenario Outline: PATCH Campaigns
    When I send a "PATCH" request to "/sobjects/Campaign/{C.id}" with json body
    """
    {
    "Status": "<status>"
    }
    """
    Then I validate the response has status code 204
    And I send a "GET" request to "/sobjects/Campaign/{C.id}"
    And I validate the response has status code 200
    And I validate the response contains "Status" equals "<status>"

    Examples:
      | status  |
      | Planned |
      | In Progress |
      | Completed |
      | Aborted |

