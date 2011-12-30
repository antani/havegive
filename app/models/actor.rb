class Actor < ActiveRecord::Base
	acts_as_gmappable
	geocoded_by :address
	def gmaps4rails_address
	  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
	  #"#{self.street}, #{self.city}, #{self.country}" 
	  address
	end
	def gmaps4rails_sidebar
		loc = Geocoder.search('#{longitude, latitude}')
		logger.info(loc)
		logger.info(longitude)
		logger.info(latitude)
		location = loc[0]
  		"<span class='foo'>#{address}</span>"
	end
end