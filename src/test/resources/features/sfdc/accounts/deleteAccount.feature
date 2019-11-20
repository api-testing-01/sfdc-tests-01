Feature: Account

  Background:
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/account" with json file "json/createAccountBody.json"
    And I save the response as "P"

  Scenario: DELETE account
    When I send a "DELETE" request to "/sobjects/account/{P.id}"
    Then I validate the response has status code 204
    And I send a "GET" request to "/sobjects/account/{P.id}"
    And I validate the response has status code 404