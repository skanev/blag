require 'spec_helper'

describe PostsController, "GET index" do
  it "should assign all posts to @posts" do
    Post.stub_chain :reverse_chronological, :paginate => 'posts'
    get :index
    assigns[:posts].should == 'posts'
  end

  it "should pass params[:page] to .paginate" do
    posts = mock('posts')
    Post.stub :reverse_chronological => posts
    posts.should_receive(:paginate).with(hash_including(:page => '42'))

    get :index, :page => '42'
  end
end

describe PostsController, "GET show" do
  it "should assign to @post" do
    Post.should_receive(:find).with('42').and_return 'post'
    get :show, :id => 42
    assigns[:post].should == 'post'
  end
end