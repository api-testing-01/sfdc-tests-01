Feature: Opportunities

  Background:
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/Opportunity" with json body
    """
    {
    "Name": "Opportunity2 created by cucumber",
    "StageName": "Prospecting",
    "CloseDate": "2019-11-02",
    "Probability": "10",
    "Amount": 2000
    }
    """
    And I save the response as "O"
    And I save the request endpoint for deleting

  @cleanData
  Scenario: PATCH Opportunities
    When I send a "PATCH" request to "/sobjects/Opportunity/{O.id}" with json body
    """
    {
    "Name": "Opportunity2 updated by cucumber"
    }
    """
    Then I validate the response has status code 204

  @cleanData
  Scenario: Add New Task associated to an opportunity
    When I send a "POST" request to "/sobjects/Task" with json body
    """
    {
    "Subject": "Send Letter",
    "WhatId": "(O.id)"
    }
    """
    Then I validate the response has status code 201
    And I save the response as "T"
    And I send a "GET" request to "/sobjects/Task/{T.id}"
    And I validate the response contains "Subject" equals "Send Letter"
