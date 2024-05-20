class Car < ApplicationRecord
  validates_presence_of :model, :gas_type, :autonomy, :refuel_time, :refuel_cost
  has_many :ownerships
  has_many :users, through: :ownerships
end
  