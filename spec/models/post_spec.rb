require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:slug) }

  describe "(unique constraints)" do
    before(:each) { Factory(:post, :old_id => 42) }

    it { should validate_uniqueness_of(:slug) }
    it { should validate_uniqueness_of(:old_id) }
  end
end