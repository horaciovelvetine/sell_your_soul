class Sucker < ActiveRecord::Base

  #this is gonna need a fixin
  has_many :sucker_corps
  has_many :corporations, through: :sucker_corps
  has_secure_password
end
