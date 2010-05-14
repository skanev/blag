require 'spec_helper'

describe WordPressLinksController, "GET date_and_slug" do
  it "should redirect to a post_path(id) when a post exists" do
    post = mock_model(Post)
    Post.should_receive(:by_date_and_slug).with('2007', '02', '12', 'post-1').and_return post

    get :date_and_slug, :year => '2007', :month => '02', :day => '12', :slug => 'post-1'

    response.should redirect_to(post_path(post))
  end
end