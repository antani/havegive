class CreateHas < ActiveRecord::Migration
  def self.up
    create_table :has do |t|
      t.integer :user_id
      t.string :has_string
      t.string :has_category
      t.string :has_place

      t.timestamps
    end
  end

  def self.down
    drop_table :has
  end
end
