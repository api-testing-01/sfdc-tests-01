Feature: Opportunities

  Background:
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/Opportunity" with json body
    """
    {
    "Name": "Opportunityview created by cucumber",
    "StageName": "Prospecting",
    "CloseDate": "2019-11-02",
    "Probability": "10",
    "Amount": 2000
    }
    """
    And I save the response as "O"
    And I save the request endpoint for deleting

  @cleanData
  Scenario: VIEW Opportunities
    When I send a "GET" request to "/sobjects/Opportunity/{O.id}"
    Then I validate the response has status code 200
    And I validate the response contains:
      | Name        | Opportunityview created by cucumber |
      | StageName   | Prospecting                      |
      | CloseDate   | 2019-11-02                       |
      | Probability | 10.0                             |
      | Amount      | 2000.0                           |