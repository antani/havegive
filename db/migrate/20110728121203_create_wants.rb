class CreateWants < ActiveRecord::Migration
  def self.up
    create_table :wants do |t|
      t.integer :user_id
      t.string :want_string
      t.string :want_category
      t.string :want_place

      t.timestamps
    end
  end

  def self.down
    drop_table :wants
  end
end
