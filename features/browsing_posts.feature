Feature: Browsing posts
  In order to be enlightened
  As a reader
  I want to be able to effortlessly read what this bright young mind has written

  Scenario: Viewing the latest posts
    Given the following posts exist:
      | Title         | Slug          | Published at |
      | Chunky bacon  | chunky-bacon  | 1 day ago    |
      | Spam and eggs | spam-and-eggs | 2 days ago   |
    When I go to the home page
    Then I should see "Chunky bacon"
    And I should see "Spam and eggs"



