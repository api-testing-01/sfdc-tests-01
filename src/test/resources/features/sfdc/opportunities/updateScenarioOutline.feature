Feature: Opportunities

  Background:
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/Opportunity" with json body
    """
    {
    "Name": "Opportunity0002 created by cucumber",
    "StageName": "Prospecting",
    "CloseDate": "2019-11-02",
    "Probability": "10",
    "Amount": 2000
    }
    """
    And I save the response as "O"

  Scenario Outline: PATCH Opportunities
    When I send a "PATCH" request to "/sobjects/Opportunity/{O.id}" with json body
    """
    {
    "Name": "<name>",
    "StageName": "<Prospecting>"
    }
    """
    Then I validate the response has status code 204
    And I send a "GET" request to "/sobjects/Opportunity/{O.id}"
    And I validate the response contains "Name" equals "<name>"
    And I validate the response contains "StageName" equals "<Prospecting>"
    And I send a "DELETE" request to "/sobjects/Opportunity/{O.id}"
    And I validate the response has status code 204
    Examples:
      | name  | Prospecting |
      | name1 |Prospecting1|
      | name2 |Prospecting2|

