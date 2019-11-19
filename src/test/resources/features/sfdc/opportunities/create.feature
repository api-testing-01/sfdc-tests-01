Feature: Opportunities

  @cleanData
  Scenario: CREATE Opportunities
    Given I use the "sfdc" service and the "admin" account
    When I send a "POST" request to "/sobjects/Opportunity" with json body
    """
    {
    "Name": "Opportunity1 created by cucumber",
    "StageName": "Prospecting",
    "CloseDate": "2019-11-02",
    "Probability": "10",
    "Amount": 2000
    }
    """
    And I save the response as "O"
    And I save the request endpoint for deleting
    Then I validate the response has status code 201
    And  I send a "GET" request to "/sobjects/Opportunity/{O.id}"
    And I validate the response contains:
      | Name        | Opportunity1 created by cucumber |
      | StageName   | Prospecting                      |
      | CloseDate   | 2019-11-02                       |
      | Probability | 10.0                             |
      | Amount      | 2000.0                           |

  Scenario: CREATE Opportunities required fields
    Given I use the "sfdc" service and the "admin" account
    When I send a "POST" request to "/sobjects/Opportunity" with json body
    """
    {
    "Probability": "10"
    }
    """
    And I save the response as "O"
    Then I validate the response has status code 400
    And I validate the response contains "message" equals "[Required fields are missing: [Name, StageName, CloseDate]]"
    And I validate the response contains "errorCode" equals "[REQUIRED_FIELD_MISSING]"

  Scenario: CREATE Opportunities invalid data
    Given I use the "sfdc" service and the "admin" account
    When I send a "POST" request to "/sobjects/Opportunity" with json body
    """
    {
    "Name": "Opportunity created by cucumber with largeName, Opportunity created by cucumber with largeName, Opportunity created by cucumber with largeName",
    "StageName": "Prospecting",
    "CloseDate": "2019-11-02",
    }
    """
    And I save the response as "O"
    Then I validate the response has status code 400
    And I validate the response contains "message" equals "[Unexpected character ('}' (code 125)): was expecting double-quote to start field name at [line:5, column:2]]"
    And I validate the response contains "errorCode" equals "[JSON_PARSER_ERROR]"
