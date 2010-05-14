ActionController::Routing::Routes.draw do |map|
  map.resources :posts
  map.connect ":year/:month/:day/:slug", :controller => :word_press_links, :action => :date_and_slug, :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/
end
