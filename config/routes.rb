ActionController::Routing::Routes.draw do |map|
  map.connect "/posts/page/:page", :controller => :posts, :action => :index, :page => /\d+/
  map.resources :posts, :has_many => :comments

  map.word_press_date_and_slug ":year/:month/:day/:slug",
                               :controller => :word_press_links,
                               :action => :date_and_slug,
                               :year => /\d{4}/,
                               :month => /\d{2}/,
                               :day => /\d{2}/
  map.word_press_old_id '/word_press/old/:old_id', :controller => :word_press_links, :action => :old_id

  map.root :controller => :home, :action => :index
end
