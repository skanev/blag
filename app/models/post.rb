class Post < ActiveRecord::Base
  validates_presence_of :title, :slug
  validates_uniqueness_of :slug
  validates_uniqueness_of :old_id, :if => 'old_id.present?'
end
