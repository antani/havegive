class CreateActors < ActiveRecord::Migration
  def self.up
    create_table :actors do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
    end
  end

  def self.down
    drop_table :actors
  end
end
