class Sucker < ActiveRecord::Base
  belongs_to :Corporation

  has_secure_password
end
