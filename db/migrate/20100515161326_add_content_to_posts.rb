class AddContentToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :content, :text, :null => false
  end

  def self.down
    remove_column :posts, :content
  end
end
