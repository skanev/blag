update_post = lambda do |post, field, value|
  case field
    when 'Title'        then post.title = value
    when 'Slug'         then post.slug = value
    when 'Published at' then post.published_at = Time.parse(value)
    when 'Old id'       then post.old_id = value
    else raise "Unknown field: #{field}"
  end
end

Given 'that I have the following blog post:' do |table|
  post = Factory.build(:post)
  table.hashes.each do |row|
    update_post.call post, row.fetch('Field'), row.fetch('Value')
  end
  post.save!
end

Then 'the following blog posts should exist:' do |expected_posts|
  actual_posts = [['Slug', 'Old id', 'Title', 'Published at']] +
      Post.all(:order => 'old_id ASC').map { |p| [p.slug, p.old_id.to_s, p.title, p.published_at.rfc2822] }

  expected_posts.diff!(actual_posts)
end