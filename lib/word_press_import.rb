module WordPressImport
  class << self
    def import_file(file_path)
      open(file_path, "r") do |file|
        document = Nokogiri::XML(file)
        base_url = document.xpath("/rss/channel/wp:base_blog_url").text

        document.xpath("//item").each do |item|
          next if item.xpath("wp:post_type").text != 'post'
          Post.create! do |post|
            post.title        = item.xpath("title").text
            post.content      = convert_internal_links base_url, item.xpath("content:encoded").text
            post.slug         = item.xpath("wp:post_name").text
            post.old_id       = item.xpath("wp:post_id").text
            post.published_at = Time.rfc2822(item.xpath("pubDate").text)
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
