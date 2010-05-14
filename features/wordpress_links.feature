Feature: WordPress compatible links
  In order to not loose links to the WordPress blog
  as a blogger
  I want old links to continue working

  Scenario: WordPress compatible links of the /:year/:month/:day/:slug kind
    Given that I have the following blog post:
      | Field        | Value                  |
      | Title        | f1rst p0st             |
      | Slug         | post-1                 |
      | Published at | 12 february 2007 12:00 |
    When I go to the address "/2007/02/12/post-1/"
    Then I should see "f1rst p0st"

  @wip
  Scenario: WordPress compatible links of the /?p=:old_id kind
    Given that I have the following blog post:
      | Field  | Value        |
      | Title  | chunky bacon |
      | Old id | 42           |
      | Slug   | chunky       |
    When I go to the address "/?p=42"
    Then I should see "chunky bacon"
