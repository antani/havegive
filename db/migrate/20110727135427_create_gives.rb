class CreateGives < ActiveRecord::Migration
  def self.up
    create_table :gives do |t|
      t.integer :user_id
      t.string :give_category
      t.string :give_place

      t.timestamps
    end
  end

  def self.down
    drop_table :gives
  end
end
