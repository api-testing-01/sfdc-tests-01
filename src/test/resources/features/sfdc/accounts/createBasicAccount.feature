Feature: Account
  @cleanData
  Scenario:
    Given I use the "sfdc" service and the "admin" account
    When I send a "POST" request to "/sobjects/account" with json body
    """
    {
    "Name": "Account0002 created by cucumber"
    }
    """
    And I save the response as "P"
    And I save the request endpoint for deleting
    And I send a "GET" request to "/sobjects/account/{P.id}"
    Then I validate the response has status code 200
