class AddGiveStringToGives < ActiveRecord::Migration
  def self.up
    add_column :gives, :give_string, :string
  end

  def self.down
    remove_column :gives, :give_string
  end
end
