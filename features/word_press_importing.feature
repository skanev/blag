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
            <wp:base_blog_url>http://blog.example.org</wp:base_blog_url>
            <item>
              <title>Software metaphors</title>
              <pubDate>Fri, 09 Mar 2007 16:47:04 +0000</pubDate>
              <content:encoded><![CDATA[Metaphors of software]]></content:encoded>
              <wp:post_id>20</wp:post_id>
              <wp:post_name>software-metaphors</wp:post_name>
              <wp:post_type>post</wp:post_type>
            </item>
            <item>
              <title>Legacy</title>
              <pubDate>Mon, 27 Apr 2009 23:59:30 +0200</pubDate>
              <content:encoded><![CDATA[Poor coder's legacy]]></content:encoded>
              <wp:post_id>216</wp:post_id>
              <wp:post_name>legacy</wp:post_name>
              <wp:post_type>post</wp:post_type>
            </item>
          </channel>
        </rss>
    """
    Then the following blog posts should exist:
      | Slug               | Old id | Title              | Content               | Published at                    |
      | software-metaphors | 20     | Software metaphors | Metaphors of software | Fri, 09 Mar 2007 16:47:04 +0000 |
      | legacy             | 216    | Legacy             | Poor coder's legacy   | Mon, 27 Apr 2009 21:59:30 +0000 |

  Scenario: Converting internal links in content to relative links
    When I import the following wordpress.xml:
      """
        <?xml version="1.0" encoding="UTF-8"?>
        <rss version="2.0" xmlns:excerpt="http://wordpress.org/export/1.0/excerpt/" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:wp="http://wordpress.org/export/1.0/">
          <channel>
            <wp:base_blog_url>http://blog.example.org</wp:base_blog_url>
            <item>
              <title>F1RST P0ST</title>
              <pubDate>Mon, 12 Feb 2007 16:03:08 +0000</pubDate>
              <content:encoded><![CDATA[<a href="http://blog.example.org/2007/02/12/post-1">Self-reference</a>]]></content:encoded>
              <wp:post_id>1</wp:post_id>
              <wp:post_name>post-1</wp:post_name>
              <wp:post_type>post</wp:post_type>
            </item>
          </channel>
        </rss>
    """
    Then the post "F1RST P0ST" should have the following content:
      """
      <a href="/2007/02/12/post-1">Self-reference</a>
      """

  @wip
  Scenario: Importing comments
    When I import the following wordpress.xml:
      """
      <?xml version="1.0" encoding="UTF-8"?>
      <rss version="2.0" xmlns:excerpt="http://wordpress.org/export/1.0/excerpt/" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:wp="http://wordpress.org/export/1.0/">
        <channel>
          <wp:base_blog_url>http://blog.example.org</wp:base_blog_url>
          <item>
            <title>Matt Groening</title>
        		<pubDate>Fri, 09 Mar 2007 08:00:00 +0000</pubDate>
        		<content:encoded><![CDATA[Pronounced "GRAY-ning"]]></content:encoded>
        		<wp:post_id>1</wp:post_id>
        		<wp:post_name>groening</wp:post_name>
        		<wp:post_type>post</wp:post_type>
            <wp:comment>
        			<wp:comment_id>2</wp:comment_id>
        			<wp:comment_author><![CDATA[Bart Simpson]]></wp:comment_author>
        			<wp:comment_author_email>bart@example.org</wp:comment_author_email>
        			<wp:comment_author_url>http://bart.example.org/</wp:comment_author_url>
        			<wp:comment_author_IP>10.0.0.1</wp:comment_author_IP>
        			<wp:comment_date_gmt>2007-03-10 12:00:00</wp:comment_date_gmt>
        			<wp:comment_content><![CDATA[Don't have a cow, man!]]></wp:comment_content>
        		</wp:comment>
        		<wp:comment>
        			<wp:comment_id>3</wp:comment_id>
        			<wp:comment_author><![CDATA[Hubert J. Farnsworth]]></wp:comment_author>
        			<wp:comment_author_email>hubert@example.org</wp:comment_author_email>
        			<wp:comment_author_url>http://hubert.example.org/</wp:comment_author_url>
        			<wp:comment_author_IP>10.0.0.2</wp:comment_author_IP>
        			<wp:comment_date_gmt>2007-03-11 12:00:00</wp:comment_date_gmt>
        			<wp:comment_content><![CDATA[Good news, everyone!]]></wp:comment_content>
        		</wp:comment>
        	</item>
          </item>
        </channel>
      </rss>
      """
    Then the post "Matt Groening" should have the following comments:
      | Author               | Email              | Url                        | IP       | Created at          | Content                |
      | Bart Simpson         | bart@example.org   | http://bart.example.org/   | 10.0.0.1 | 2007-03-10 12:00:00 | Don't have a cow, man! |
      | Hubert J. Farnsworth | hubert@example.org | http://hubert.example.org/ | 10.0.0.2 | 2007-03-11 12:00:00 | Good news, everyone!   |
