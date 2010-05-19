Feature: User authentication
  In order to restrict publishing only to those limited few
  As a blog owner
  I want users to have to authenticate for access to management activities

  @wip
  Scenario: Logging in
    Given only the following users exist:
      | Email             | Password |
      | homer@example.org | d'oh     |
    When I go to the login page
    And fill in "E-mail" with "homer@example.org"
    And fill in "Password" with "d'oh"
    And press "Log in"
    Then I should be logged in as "homer@example.org"

  @wip
  Scenario: Attempting to log in with bad credentials
    Given only the following users exist:
      | Email             | Password |
      | homer@example.org | d'oh     |
    When I go to the login page
    And fill in "E-mail" with "homer@example.org"
    And fill in "Password" with "mmmm... donuts"
    And press "Log in"
    Then I should not be logged in

  @wip
  Scenario: Logging out
    Given I am logged in
    When I go to the home page
    And press "Log out"
    Then I should be on the home page
    And I should not be logged in
