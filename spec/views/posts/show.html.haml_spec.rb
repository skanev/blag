require 'spec_helper'

describe 'posts/show.html.haml' do
  before(:each) do
    @post = mock_model(Post, :title => '', :content => '', :comments => [])
    assigns[:post] = @post
  end

  it "should render @post.title" do
    @post.stub :title => 'The title of a post'

    render

    response.should include_text('The title of a post')
  end

  it "should render the _comment_form partial" do
    assigns[:post] = @post
    assigns[:new_comment] = 'new-comment'
    template.should_receive(:render).with(:partial => 'posts/comment_form', :locals => {:post => @post, :new_comment => 'new-comment'})

    render
  end
end