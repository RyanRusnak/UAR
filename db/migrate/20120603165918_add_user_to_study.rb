class AddUserToStudy < ActiveRecord::Migration
  def self.up
    add_column :studies, :user, :reference
  end

  def self.down
    remove_column :studies, :user, :reference
  end
end
