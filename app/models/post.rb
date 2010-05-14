class Post < ActiveRecord::Base
  validates_presence_of :title, :slug
  validates_uniqueness_of :slug
  validates_uniqueness_of :old_id, :if => 'old_id.present?'

  def self.by_date_and_slug(year, month, day, slug)
    Post.first(:conditions => ["date_trunc('day', published_at) = ? AND slug = ?", "#{year}-#{month}-#{day}", slug])
  end
end
