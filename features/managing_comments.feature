Feature: Managing comments
  In order to enforce a dictatorial censorship on who comments what
  As a cool, yet self-righteous writer
  I want to have strict control over which comments get published

  Background:
    Given I am logged in

  @wip
  Scenario: Viewing all comments
    Given the following comments exist:
      | Author        | Email             | Url                      | IP       | Content       | Status  |
      | Bart Simpsons | bart@simpsons.org | http://bart.example.org/ | 10.0.0.1 | Eat my shorts | pending |
    When I go to manage comments
    Then I should see "Bart Simpsons"
    And I should see a link to "http://bart.example.org/"
    And should see "bart@simpsons.org"
    And should see "10.0.0.1"
    And should see "Eat my shorts"
    And should see "Pending"

  @wip
  Scenario: Approving a comment
    Given the following comments exist:
      | Author        | Content       | Status  |
      | Bart Simpsons | Eat my shorts | pending |
    When I go to manage comments
    And I approve the comment "Eat my shorts"
    Then the following comments should exist:
      | Author        | Content       | Status   |
      | Bart Simpsons | Eat my shorts | approved |

  @wip
  Scenario: Deleting a comment
    Given the following comments exist:
      | Author        | Content       | Status  |
      | Bart Simpsons | Eat my shorts | pending |
    When I go to manage comments
    And I delete the comment "Eat my shorts"
    Then no comments from "Bart Simpsons" should exist
