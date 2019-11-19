Feature: Groups Delete

  Scenario: Delete an existing group
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/Group" with json body
    """
    {
    "Name": "A group to delete"
    }
    """
    And I save the response as "g"
    When I send a "DELETE" request to "/sobjects/Group/{g.id}"
    Then I validate the response has status code 204


  Scenario: Delete a non-existing group
    Given I use the "sfdc" service and the "admin" account
    When I send a "DELETE" request to "/sobjects/Group/00G"
    Then I validate the response has status code 404

  Scenario: Delete a group without send an id
    Given I use the "sfdc" service and the "admin" account
    When I send a "DELETE" request to "/sobjects/Group/"
    Then I validate the response has status code 405