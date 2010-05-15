Feature: Importing from WordPress
  In order to not loose any content
  As a the one who codes this up
  I want to be able to import all my stuff from WordPress before settings this up

  Scenario: Importing a posts
    When I import the following wordpress.xml:
      """
        <?xml version="1.0" encoding="UTF-8"?>
        <rss version="2.0" xmlns:excerpt="http://wordpress.org/export/1.0/excerpt/" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:wp="http://wordpress.org/export/1.0/">
          <channel> 
            <item>
              <title>Software metaphors</title>
              <pubDate>Fri, 09 Mar 2007 16:47:04 +0000</pubDate>
              <wp:post_id>20</wp:post_id>
              <wp:post_name>software-metaphors</wp:post_name>
            </item>
            <item>
              <title>Legacy</title>
              <pubDate>Mon, 27 Apr 2009 23:59:30 +0200</pubDate>
              <wp:post_id>216</wp:post_id>
              <wp:post_name>legacy</wp:post_name>
            </item>
          </channel>
        </rss>
    """
    Then the following blog posts should exist:
      | Slug               | Old id | Title              | Published at                    |
      | software-metaphors | 20     | Software metaphors | Fri, 09 Mar 2007 16:47:04 +0000 |
      | legacy             | 216    | Legacy             | Mon, 27 Apr 2009 21:59:30 +0000 |

