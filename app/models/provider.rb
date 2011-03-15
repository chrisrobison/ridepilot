class Provider < ActiveRecord::Base
  has_many :roles
  has_many :users, :through=>:roles
  has_many :drivers
  has_many :vehicles
end
