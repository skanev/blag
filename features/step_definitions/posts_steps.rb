Given /^that I have the following blog post:$/ do |table|
  post = Post.new
  table.hashes.each do |row|
    field, value = row.fetch('Field'), row.fetch('Value')
    case field
      when 'Title'        then post.title = value
      when 'Slug'         then post.slug = value
      when 'Published at' then post.published_at = Time.parse(value)
      when 'Old id'       then post.old_id = value
      else raise "Unknown field: #{field}"
    end
  end
  post.save!
end