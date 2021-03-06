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

  Scenario: Paginating posts
    Given the following posts exist:
      | Title   | Published at |
      | Post 1  | 1 day ago    |
      | Post 2  | 2 days ago   |
      | Post 3  | 3 days ago   |
      | Post 4  | 4 days ago   |
      | Post 5  | 5 days ago   |
      | Post 6  | 6 days ago   |
      | Post 7  | 7 days ago   |
      | Post 8  | 8 days ago   |
      | Post 9  | 9 days ago   |
      | Post 10 | 10 days ago  |
      | Post 11 | 11 days ago  |
      | Post 12 | 12 years ago |
    When I go to posts page 2
    Then I should see "Post 11"
    And I should see "Post 12"

  Scenario: Viewing leading texts when browsing posts
    Given the following post exists:
      | Field   | Value                                      |
      | Content | Leading content <!--more--> Hidden content |
    When I go to the home page
    Then I should see "Leading content"
    But I should not see "Hidden content"

  Scenario: Viewing a post that contains markdown
    Given the following post exists:
      | Field   | Value          |
      | Content | Hello _world_! |
    When I go to the home page
    Then I should see the following HTML:
      """
      Hello <em>world</em>!
      """

  Scenario: Viewing a post
    Given the following post exists:
      | Field   | Value                         |
      | Title   | Do or do not                  |
      | Content | There is <!--more--> _no_ try |
    When I go to the post titled "Do or do not"
    Then I should see "Do or do not"
    And I should see "There is no try"
    And I should see the following HTML:
      """
      <em>no</em> try
      """

  Scenario: Viewing the comments of a post
    Given the following post exists:
      | Field | Value      |
      | Title | Wise words |
    And the post "Wise words" has the following comments:
      | Author    | Url                            | Content                               |
      | Aristotle | http://artistotle.example.org/ | A is A!                               |
      | Plato     |                                | Necessity... the mother of invention. |
    When I go to the post titled "Wise words"
    Then I should see "A is A!"
    And I should see "Necessity... the mother of invention."
    # And I should see a link to "http://aristotle.example.org/"
