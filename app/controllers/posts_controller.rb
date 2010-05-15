class PostsController < ApplicationController
  POSTS_PER_PAGE = 10

  def index
    @posts = Post.reverse_chronological.paginate :page => params[:page] || 1, :per_page => POSTS_PER_PAGE, :order => 'published_at DESC'
  end

  def show
    @post = Post.find(params[:id])
  end
end
