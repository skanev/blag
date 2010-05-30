class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @new_comment = Comment.new params[:comment]
    @new_comment.post = @post
    @new_comment.ip = request.remote_ip

    if @new_comment.save
      flash[:notice] = "Your comment is awaiting approval"
      redirect_to post_path(@post, :anchor => :comments)
    else
      render :template => 'posts/show'
    end
  end
end
