class Have < ActiveRecord::Base
	belongs_to  :user
	attr_accessible :have_string
end
