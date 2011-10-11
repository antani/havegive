class CreateHaves < ActiveRecord::Migration
  def self.up
    create_table :haves do |t|
      t.integer :user_id
      t.string :have_category
      t.string :have_place

      t.timestamps
    end
  end

  def self.down
    drop_table :haves
  end
end
