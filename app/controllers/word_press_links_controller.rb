class WordPressLinksController < ApplicationController
  def date_and_slug
    post = Post.by_date_and_slug(params[:year], params[:month], params[:day], params[:slug])

    redirect_to post_path(post)
  end

  def old_id
    post = Post.find_by_old_id(params[:old_id])

    redirect_to post_path(post)
  end
end
