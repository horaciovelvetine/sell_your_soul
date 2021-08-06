class Sucker < ActiveRecord::Base
  
  has_secure_password

  has_many :sucker_corps
  has_many :corporations, through: :sucker_corps

  validates  :username, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name, :primary_email
  
end
