require 'spec_helper'

describe CommentsController, "POST create" do
  def post_comment(params = {})
    post :create, {:post_id => @post.id}.merge(params)
  end

  before(:each) do
    @post = mock_model(Post)
    @new_comment = mock_model(Comment).as_null_object
    Post.stub :find => @post
    Comment.stub :new => @new_comment
  end

  it "should assign the post to @post" do
    Post.should_receive(:find).with('42').and_return(@post)

    post_comment :post_id => '42'

    assigns[:post].should == @post
  end

  it "should assign the new comment to @new_comment" do
    post_comment

    assigns[:new_comment].should == @new_comment
  end

  it "should create a new comment with the attributes in params[:comment]" do
    Comment.should_receive(:new).with('comment')

    post_comment :comment => 'comment'
  end

  it "should attempt to save the new comment" do
    @new_comment.should_receive(:save)

    post_comment
  end

  it "should set the IP of the comment" do
    request.stub :remote_ip => 'remote-ip'
    @new_comment.should_receive(:ip=).with('remote-ip')

    post_comment
  end

  it "should set the post of the comment" do
    @new_comment.should_receive(:post=).with(@post)

    post_comment
  end

  context "(when valid)" do
    before(:each) do
      @new_comment.stub :save => true
      post_comment
    end

    it { should set_the_flash }
    it "should redirect to the comments in the post" do
      response.should redirect_to(post_path(@post, :anchor => :comments))
    end
  end

  context "(when invalid)" do
    before(:each) do
      @new_comment.stub :save => false
      post_comment
    end

    it { should_not set_the_flash }
    it { should render_template('posts/show') }
  end
end
