Feature: Commenting posts
  In order to to give interesting, yet superfluous feedback
  As a reader
  I want to be able to comment posts

  @wip
  Scenario: Commenting on a blog post
    Given the following post exists:
      | Field | Value           |
      | Title | Infinite wisdom |
    When I go to the post titled "Infinite wisdom"
    And I fill in "Name" with "Bart Simpsons"
    And I fill in "E-mail" with "bart@example.org"
    And I fill in "Site" with "http//bart.example.org/"
    And I fill in "Comment" with "Eat my shorts!"
    And I solve the comment captcha
    And I press "Comment"
    Then I should be on the post titled "Infinite wisdom"
    And I should see "Your comment is awaiting approval"
    And the post "Infinite wisdom" should have the following comments:
      | Name          | Email            | Url                      | Status  | Content       |
      | Bart Simpsons | bart@example.org | http://bart.example.org/ | pending | Eat my shorts |


