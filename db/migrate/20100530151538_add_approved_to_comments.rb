class AddApprovedToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :approved, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :comments, :approved
  end
end
