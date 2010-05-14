require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:slug) }

  describe "(unique constraints)" do
    before(:each) { Factory(:post, :old_id => 42) }

    it { should validate_uniqueness_of(:slug) }
    it { should validate_uniqueness_of(:old_id) }
  end

  describe "#by_date_and_slug(year, month, day, slug)" do
    it "should return a post matching the given criteria if it exists" do
      post = Factory(:post, :published_at => Time.parse("12 February 2007 12:00"), :slug => "post-1")
      Post.by_date_and_slug('2007', '02', '12', 'post-1').should == post
    end

    it "should return nil when no such post exists" do
      Factory(:post, :published_at => Time.parse("12 February 2007 12:00"), :slug => "post-1")
      Post.by_date_and_slug('2008', '02', '12', 'post-1').should be_nil
      Post.by_date_and_slug('2007', '01', '12', 'post-1').should be_nil
      Post.by_date_and_slug('2007', '02', '13', 'post-1').should be_nil
      Post.by_date_and_slug('2007', '02', '12', 'post-2').should be_nil
    end
  end
end