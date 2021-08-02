class Sucker < ActiveRecord::Base

  #this is gonna need a fixin
  has_and_belongs_to_many :corporations
  has_secure_password
end
