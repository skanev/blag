class Comment < ActiveRecord::Base
  validates_presence_of :post_id, :author, :email, :ip

  before_validation :sanitize_content

  belongs_to :post

  private
    def sanitize_content
      self.content = CommentSanitizer.clean(content)
    end
end
