class Corporation < ActiveRecord::Base
  has_and_belongs_to_many :suckers
end
