class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text      :title,         :null => false
      t.string    :slug,          :null => false
      t.datetime  :published_at
      t.integer   :old_id

      t.timestamps
    end
    
    add_index :posts, :slug, :unique => true
    add_index :posts, :old_id, :unique => true
  end

  def self.down
    drop_table :posts
  end
end
