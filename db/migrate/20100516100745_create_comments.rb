class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.belongs_to  :post,    :null => false
      t.string      :author,  :null => false
      t.string      :email,   :null => false
      t.string      :url,     :length => 1024
      t.string      :ip,      :null => false
      t.text        :content, :null => false
      t.timestamps
    end

    add_index :comments, :post_id
  end

  def self.down
    drop_table :comments
  end
end
