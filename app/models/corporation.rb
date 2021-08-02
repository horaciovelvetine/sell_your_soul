class Corporation < ActiveRecord::Base
  #so do this 
  # needs to be through corpo_suckers joins table / creation
  has_many :sucker_corps
  has_many :suckers, through :sucker_corps
end
