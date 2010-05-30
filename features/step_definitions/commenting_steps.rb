comment_fields = {
  :author => 'Name',
  :email => 'E-mail',
  :url => 'Site',
  :content => 'Comment',
}

Given 'a blog post exists' do
  @post = Factory(:post)
end

When 'I attempt to leave a comment, forgetting to fill in "$1"' do |field_name|
  @invalid_comment = Factory.build(:comment, comment_fields.invert.fetch(field_name) => "")

  visit post_path(@post)
  comment_fields.each do |field, field_name|
    value = @invalid_comment.send(field)
    When %{I fill in "#{field_name}" with "#{value}"}
  end
  When %{I press "Leave a comment"}
end

Then 'I should see my previous input in the comment form' do
  comment_fields.each do |field, field_name|
    value = @invalid_comment.send(field)
    Then %{the "#{field_name}" field should contain "#{value}"}
  end
end