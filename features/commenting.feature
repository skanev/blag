Feature: Commenting posts
  In order to to give interesting, yet superfluous feedback
  As a reader
  I want to be able to comment posts

  Scenario: Commenting on a blog post
    Given the following post exists:
      | Field | Value           |
      | Title | Infinite wisdom |
    When I go to the post titled "Infinite wisdom"
    And I fill in "Name" with "Bart Simpsons"
    And I fill in "E-mail" with "bart@example.org"
    And I fill in "Site" with "http://bart.example.org/"
    And I fill in "Comment" with "Eat my shorts!"
    And I solve the comment captcha
    And I press "Leave a comment"
    Then I should be on the post titled "Infinite wisdom"
    And I should see "Your comment is awaiting approval"
    And the post "Infinite wisdom" should have the following comments:
      | Author        | Email            | Url                      | Approved | Content        |
      | Bart Simpsons | bart@example.org | http://bart.example.org/ | false    | Eat my shorts! |

  Scenario Outline: Leaving out a required field when commenting
    Given a blog post exists
    And I attempt to leave a comment, forgetting to fill in "<Required field>"
    Then I should see "There was an error in your comment"
    And I should see my previous input in the comment form

    Examples:
      | Required field |
      | Name           |
      | E-mail         |
      | Comment        |
