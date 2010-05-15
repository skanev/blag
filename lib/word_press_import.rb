module WordPressImport
  class << self
    def import_file(file_path)
      open(file_path, "r") do |file|
        Nokogiri::XML(file).xpath("//item").each do |item|
          next if item.xpath("wp:post_type").text != 'post'
          Post.create! do |post|
            post.title        = item.xpath("title").text
            post.content      = item.xpath("content:encoded").text
            post.slug         = item.xpath("wp:post_name").text
            post.old_id       = item.xpath("wp:post_id").text
            post.published_at = Time.rfc2822(item.xpath("pubDate").text)
          end
        end
      end
    end
  end
end
