#Feature: Opportunities
#
#  Background:
#    Given I use the "sfdc" service and the "admin" account
#    And I send a "POST" request to "/sobjects/Opportunity" with json body
#    """
#    {
#    "Name": "Opportunity4 created by cucumber",
#    "StageName": "Prospecting",
#    "CloseDate": "2019-11-02",
#    "Probability": "10",
#    "Amount": 2000
#    }
#    """
#    And I save the response as "O"
#
#  @cleanData
#  Scenario: VIEW Opportunities
#    When I send a "GET" request to "/sobjects/Opportunity/{O.id}"
#    Then I validate the response has status code 200