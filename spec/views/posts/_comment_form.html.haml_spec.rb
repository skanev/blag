require 'spec_helper'

describe 'posts/_comment_form.html.haml' do
  before(:each) do
    @post = mock_model(Post)
    template.stub :post => @post
  end

  context "(when new_comment is present)" do
    before(:each) do
      template.stub :new_comment => mock_model(Comment).as_null_object
    end

    it "should render 'There was an error in your comment'" do
      render
      response.should include_text('There was an error in your comment')
    end
  end

  context "(when new_comment is blank)" do
    before(:each) do
      template.stub :new_comment => nil
    end

    it "should not render 'There was an error in your comment'" do
      render
      response.should_not include_text('There was an error in your comment')
    end

    it "should render a form for a new comment" do
      comment = mock_model(Comment)
      Comment.should_receive(:new).and_return(comment)
      template.should_receive(:form_for).with([@post, comment])
      render
    end
  end
end