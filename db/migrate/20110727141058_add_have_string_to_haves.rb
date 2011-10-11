class AddHaveStringToHaves < ActiveRecord::Migration
  def self.up
    add_column :haves, :have_string, :string
  end

  def self.down
    remove_column :haves, :have_string
  end
end
