require 'spec_helper'

describe Comment do
  it { should belong_to(:post) }

  it { should validate_presence_of(:post_id) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:ip) }
end