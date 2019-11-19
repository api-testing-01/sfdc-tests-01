Feature: Account

  Background:
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/account" with json file "json/createAccountBody.json"
    And I save the response as "P"
    And I save the request endpoint for deleting

  @cleanData
  Scenario: PATCH account
    When I send a "PATCH" request to "/sobjects/account/{P.id}" with json file "json/updateAccountBody.json"
    Then I validate the response has status code 204
    And I send a "GET" request to "/sobjects/account/{P.id}"
    And I validate the response contains:
      | Name             | Account0003 created by cucumber updated  |
      | Type             | Customer - Direct                        |
      | BillingStreet    | Simon Lopez updated                      |
      | BillingCity      | Quillacollo updated                      |
      | BillingState     | Cochabamba updated                       |
      | BillingPostalCode| 1009                                     |
      | BillingCountry   | Bolivia updated                          |

