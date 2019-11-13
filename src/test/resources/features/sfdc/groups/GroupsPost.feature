Feature: Groups Post

  Background:
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/Group" with json body
    """
    {
    "Name": "This is my group"
    }
    """
    And I save the response as "g"

  Scenario: PATCH Groups
    When I send a "PATCH" request to "/sobjects/Group/{g.id}" with json body
    """
    {
    "Name": "Group edited",
    "Email": "bruxita2312@gmail.com"
    }
    """
    Then I validate the response has status code 204
    And I send a DELETE request to "/sobjects/Group/{g.id}"
    And I validate the response has status code 204