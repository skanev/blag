module WordPressImport
  class << self
    def import_file(file_path)
      open(file_path, "r") do |file|
        document = Nokogiri::XML(file)
        base_url = document.xpath("/rss/channel/wp:base_blog_url").text

        document.xpath("//item[wp:post_type[text() = 'post']]").each do |item|
          post = Post.create! do |post|
            post.title        = item.xpath("title").text
            post.content      = convert_internal_links base_url, item.xpath("content:encoded").text
            post.slug         = item.xpath("wp:post_name").text
            post.old_id       = item.xpath("wp:post_id").text
            post.published_at = Time.rfc2822(item.xpath("pubDate").text)
          end

          item.xpath("wp:comment[wp:comment_approved[text() = '1'] and not(wp:comment_type[text() = 'pingback'])]").each do |node|
            comment = post.comments.create! do |comment|
              comment.author     = node.xpath("wp:comment_author").text
              comment.email      = node.xpath("wp:comment_author_email").text
              comment.url        = node.xpath("wp:comment_author_url").text
              comment.ip         = node.xpath("wp:comment_author_IP").text
              comment.content    = node.xpath("wp:comment_content").text
              comment.created_at = node.xpath("wp:comment_date_gmt").text
              comment.updated_at = comment.created_at
            end
          end
        end
      end
    end

    def convert_internal_links(base_url, content)
      url_regexp = Regexp.escape(base_url)
      content.gsub(/href="#{url_regexp}(\/(.*?))"/, 'href="\1"').gsub(/\]\(#{url_regexp}(\/.*?)\)/, '](\1)')
    end
  end
end
