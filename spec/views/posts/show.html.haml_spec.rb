require 'spec_helper'

describe 'posts/show.html.haml' do
  it "should render @post.title" do
    assigns[:post] = mock(:title => 'The title of a post')
    render
    response.should include_text('The title of a post')
  end
end