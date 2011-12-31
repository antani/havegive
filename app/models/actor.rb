class Actor < ActiveRecord::Base
	acts_as_gmappable
	attr_accessible :address, :latitude, :longitude
	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude
	after_validation :geocode, :reverse_geocode 
    
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
	def as_json(options={})
  		{ :lng => self.longitude, :lat => self.latitude, :address => self.address }
	end
end
