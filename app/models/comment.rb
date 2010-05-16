class Comment < ActiveRecord::Base
  validates_presence_of :post_id, :author, :email, :ip

  belongs_to :post
end
