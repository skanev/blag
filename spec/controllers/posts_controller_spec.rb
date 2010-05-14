require 'spec_helper'

describe PostsController, "GET show" do
  it "should assign to @post" do
    Post.should_receive(:find).with('42').and_return 'post'
    get :show, :id => 42
    assigns[:post].should == 'post'
  end
end