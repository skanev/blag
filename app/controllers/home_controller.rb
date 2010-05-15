class HomeController < ApplicationController
  def index
    redirect_to word_press_old_id_path(params[:p]) if params.except(:action, :controller).keys == ['p']
  end
end
