class Give < ActiveRecord::Base
	belongs_to :user
	attr_accessible :give_string
end
