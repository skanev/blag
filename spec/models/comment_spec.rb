require 'spec_helper'

describe Comment do
  it { should belong_to(:post) }

  it { should validate_presence_of(:post_id) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:ip) }

  it "should sanitize #content on create" do
    CommentSanitizer.stub(:clean).with('tainted content').and_return('clean content')
    Factory(:comment, :content => 'tainted content').content.should == 'clean content'
  end

  it "should sanitize #content on update" do
    comment = Factory(:comment)
    CommentSanitizer.stub(:clean).with('tainted content').and_return('clean content')
    comment.update_attributes! :content => 'tainted content'
    comment.reload.content.should == 'clean content'
  end

  it "should be pendning by default" do
    Comment.new.should_not be_approved
  end
end