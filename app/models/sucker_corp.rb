class SuckerCorp < ActiveRecord::Base
  belongs_to :corporation
  belongs_to :sucker
end
