class User < Omnisocial::User
  # Make any customisations here
  has_many :wants
  has_many :has

end