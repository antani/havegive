class User< ActiveRecord::Base
  has_many :wants
  has_many :has

end