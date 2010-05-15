require 'spec_helper'

describe HomeController, "GET ?p=42" do
  it "should redirect to post with old_id = 42 if one exists" do
    get :index, :p => '42'
    response.should redirect_to(word_press_old_id_path(42))
  end
end

describe HomeController, "GET /" do
end