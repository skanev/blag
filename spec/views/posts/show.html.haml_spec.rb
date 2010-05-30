require 'spec_helper'

describe 'posts/show.html.haml' do
  it "should render @post.title" do
    assigns[:post] = mock_model(Post, :title => 'The title of a post', :content => '', :comments => [])
    render
    response.should include_text('The title of a post')
  end

  it "should render 'There was an error in your comment' if @new_comment is present" do
    assigns[:post] = mock_model(Post, :title => 'The title of a post', :content => '', :comments => [])
    assigns[:new_comment] = mock_model(Comment).as_null_object
    render
    response.should include_text('There was an error in your comment')
  end

  it "should not render 'There was an error in your comment' if @new_comment is nil" do
    assigns[:post] = mock_model(Post, :title => 'The title of a post', :content => '', :comments => [])
    assigns[:new_comment] = nil
    render
    response.should_not include_text('There was an error in your comment')
  end
end