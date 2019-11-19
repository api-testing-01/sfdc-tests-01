Feature: Account

  Background:
    Given I use the "sfdc" service and the "admin" account
    When I send a "POST" request to "/sobjects/account" with json file "json/createAccountBody.json"
    And I save the response as "P"
    And I save the request endpoint for deleting

  @cleanData
  Scenario: GET Account
    When I send a "GET" request to "/sobjects/account/{P.id}"
    Then I validate the response has status code 200
    And I validate the response contains:
      | Name             | Account0003 created by cucumber |
      | Type             | Prospect                        |
      | BillingStreet    | Simon Lopez                     |
      | BillingCity      | Quillacollo                     |
      | BillingState     | Cochabamba                      |
      | BillingPostalCode| 1008                            |
      | BillingCountry   | Bolivia                         |
