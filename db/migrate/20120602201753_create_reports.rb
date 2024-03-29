class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.string :title
      t.text :body
      t.references :study

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
