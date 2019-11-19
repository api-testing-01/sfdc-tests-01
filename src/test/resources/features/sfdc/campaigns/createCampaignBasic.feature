Feature: Campaigns

  Scenario: POST Campaigns
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/Campaign" with json body
    """
    {
    "Name": "Campaign0002 created by cucumber"
    }
    """
    And I save the response as "C"
    Then I validate the response has status code 201
    And I validate the response contains "success" equals "true"
    And I send a "DELETE" request to "/sobjects/Campaign/{C.id}"
    And I validate the response has status code 204