class Sucker < ActiveRecord::Base
  has_and_belongs_to_many :corporations
  has_secure_password
end
