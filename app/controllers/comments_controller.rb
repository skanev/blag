class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.comments.create params[:comment].merge(:ip => request.remote_ip)
    flash[:notice] = "Your comment is awaiting approval"
    redirect_to post_path(post, :anchor => :comments)
  end
end
