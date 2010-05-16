update_post = lambda do |post, field, value|
  case field
    when 'Title'        then post.title = value
    when 'Content'      then post.content = value
    when 'Slug'         then post.slug = value
    when 'Published at' then post.published_at = Chronic.parse(value)
    when 'Old id'       then post.old_id = value
    else raise "Unknown field: #{field}"
  end
end

Given 'the following post exists:' do |table|
  post = Factory.build(:post)
  table.hashes.each do |row|
    update_post.call post, row.fetch('Field'), row.fetch('Value')
  end
  post.save!
end

Given 'the following posts exist:' do |table|
  table.hashes.each do |row|
    post = Factory.build(:post)
    row.each do |field, value|
      update_post.call post, field, value
    end
    post.save!
  end
end

Then 'the following blog posts should exist:' do |expected_posts|
  actual_posts = [['Slug', 'Old id', 'Title', 'Content', 'Published at']] +
      Post.all(:order => 'old_id ASC').map { |p| [p.slug, p.old_id.to_s, p.title, p.content, p.published_at.rfc2822] }

  expected_posts.diff!(actual_posts)
end

Then 'the post "$title" should have the following content:' do |title, content|
  Post.find_by_title!(title).content.strip.should == content.strip
end