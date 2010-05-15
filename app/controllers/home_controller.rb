class HomeController < ApplicationController
  def index
    # TODO Move this to posts#index and redirect there instead
    if params.except(:action, :controller).keys == ['p']
      redirect_to word_press_old_id_path(params[:p])
    else
      redirect_to posts_path
    end
  end
end
