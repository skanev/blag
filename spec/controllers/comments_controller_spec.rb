require 'spec_helper'

describe CommentsController, "POST create" do
  context "(when valid)" do
    before(:each) do
      @post = mock_model(Post, :comments => double("comments"))
      Post.stub :find => @post
      @post.comments.stub :create => true, :comment => {}
    end

    it "should create a new comment" do
      Post.should_receive(:find).with('42').and_return(@post)
      @post.comments.should_receive(:create).and_return(true)

      post :create, :post_id => '42', :comment => {}
    end

    it "should set the IP of the comment" do
      @post.comments.should_receive(:create).with(hash_including(:ip => 'remote-ip'))
      request.stub :remote_ip => 'remote-ip'

      post :create, :post_id => '42', :comment => {}
    end

    it "should redirect to the comments in the post" do
      post :create, :post_id => '42', :comment => {}

      response.should redirect_to(post_path(@post, :anchor => :comments))
    end

    it "should set the flash" do
      post :create, :post_id => '42', :comment => {}

      should set_the_flash
    end
  end
end
