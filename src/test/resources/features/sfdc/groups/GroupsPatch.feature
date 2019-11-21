Feature: Groups Patch

  Background:
    Given I use the "sfdc" service and the "admin" account
    And I send a "POST" request to "/sobjects/Group" with json body
    """
    {
    "Name": "This is my group"
    }
    """
    And I save the response as "g"
    And I save the request endpoint for deleting

  @cleanData
  Scenario: PATCH Groups
    When I send a "PATCH" request to "/sobjects/Group/{g.id}" with json body
    """
    {
    "Name": "Group edited again",
    "DoesSendEmailToMembers": "true",
    "DoesIncludeBosses": "true"
    }
    """
    Then I validate the response has status code 204
    And I send a "GET" request to "/sobjects/Group/{g.id}"
    And I validate the response contains "Name" equals "Group edited again"
    And I validate the response contains "Type" equals "Regular"

  @cleanData
  Scenario Outline: PATCH Groups with combinations
    When I send a "PATCH" request to "/sobjects/Group/{g.id}" with json body
    """
    {
    "Name": "<name>",
    "DoesSendEmailToMembers": "<DoesSendEmailToMembers>",
    "DoesIncludeBosses": "<DoesIncludeBosses>"
    }
    """
    Then I validate the response has status code <Code>
    And I send a "GET" request to "/sobjects/Group/{g.id}"
    And I validate the response contains "Name" equals "<name>"
    And I validate the response contains "DoesSendEmailToMembers" equals "<DoesSendEmailToMembers>"
    And I validate the response contains "DoesIncludeBosses" equals "<DoesIncludeBosses>"
    Examples:
      | name           | DoesSendEmailToMembers | DoesIncludeBosses | Code |
      | First edition  | true                   | true              | 204  |
      | Second edition | true                   | false             | 204  |
      | Third edition  | false                  | true              | 204  |
      | Fourth edition | false                  | false             | 204  |

  @cleanData
  Scenario Outline: PATCH Groups with combinations negative
    When I send a "PATCH" request to "/sobjects/Group/{g.id}" with json body
    """
    {
    "Name": "<name>",
    "DoesSendEmailToMembers": "<DoesSendEmailToMembers>",
    "DoesIncludeBosses": "<DoesIncludeBosses>"
    }
    """
    Then I validate the response has status code <Code>
    And I send a "GET" request to "/sobjects/Group/{g.id}"
    And I validate the response contains "Name" not equals "<name>"
    And I validate the response contains "DoesSendEmailToMembers" not equals "<DoesSendEmailToMembers>"
    And I validate the response contains "DoesIncludeBosses" not equals "<DoesIncludeBosses>"
    Examples:
      | name           | DoesSendEmailToMembers | DoesIncludeBosses | Code |
      | Fifth edition  | null                   |                   | 400  |
      |                |                        |                   | 400  |