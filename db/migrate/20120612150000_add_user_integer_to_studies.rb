class AddUserIntegerToStudies < ActiveRecord::Migration
  def self.up
    remove_column :studies, :user, :reference
    add_column :studies, :user_uid, :integer
  end

  def self.down
    add_column :studies, :user, :reference
    remove_column :studies, :user_uid, :integer
  end
end
