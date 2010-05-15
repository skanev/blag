class Post < ActiveRecord::Base
  validates_presence_of :title, :slug, :content
  validates_uniqueness_of :slug
  validates_uniqueness_of :old_id, :if => 'old_id.present?'

  named_scope :reverse_chronological, :order => 'published_at DESC'

  def self.by_date_and_slug(year, month, day, slug)
    Post.first(:conditions => ["date_trunc('day', published_at) = ? AND slug = ?", "#{year}-#{month}-#{day}", slug])
  end

  def leading_text
    content.gsub(/<!--\s*more\s*-->.*/m, '').strip
  end
end
