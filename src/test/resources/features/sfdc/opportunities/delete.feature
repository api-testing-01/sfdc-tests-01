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

  Scenario: DELETE Opportunities
    When I send a "DELETE" request to "/sobjects/Opportunity/{O.id}"
    Then I validate the response has status code 204
    And  I send a "GET" request to "/sobjects/Opportunity/{O.id}"
    And I validate the response contains "errorCode" equals "[NOT_FOUND]"
    And I validate the response contains "message" equals "[The requested resource does not exist]"
