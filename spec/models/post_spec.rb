require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:content) }

  it { should have_many(:comments) }

  describe "(unique constraints)" do
    before(:each) { Factory(:post, :old_id => 42) }

    it { should validate_uniqueness_of(:slug) }
    it { should validate_uniqueness_of(:old_id) }
  end

  it "#leading_text should return everythings before the <!--more--> marker, stripped" do
    Factory(:post, :content => "leading\ntext <!--more--> hidden\ntext").leading_text.should == "leading\ntext"
    Factory(:post, :content => "no marker").leading_text.should == "no marker"
  end

  describe "#by_date_and_slug(year, month, day, slug)" do
    it "should return a post matching the given criteria if it exists" do
      post = Factory(:post, :published_at => Chronic.parse("2007-02-12 12:00"), :slug => "post-1")
      Post.by_date_and_slug('2007', '02', '12', 'post-1').should == post
    end

    it "should return nil when no such post exists" do
      Factory(:post, :published_at => Chronic.parse("2007-02-12 12:00"), :slug => "post-1")
      Post.by_date_and_slug('2008', '02', '12', 'post-1').should be_nil
      Post.by_date_and_slug('2007', '01', '12', 'post-1').should be_nil
      Post.by_date_and_slug('2007', '02', '13', 'post-1').should be_nil
      Post.by_date_and_slug('2007', '02', '12', 'post-2').should be_nil
    end
  end

  it ".reverse_chronological should return posts in reverse chronological order" do
    oldest = Factory(:post, :published_at => 9.days.ago)
    newest = Factory(:post, :published_at => 1.days.ago)
    middle = Factory(:post, :published_at => 5.days.ago)

    Post.reverse_chronological.should == [newest, middle, oldest]
  end
end