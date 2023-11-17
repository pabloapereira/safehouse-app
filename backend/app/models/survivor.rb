class Survivor < ApplicationRecord
  has_one :location, dependent: :destroy
  accepts_nested_attributes_for :location
  
  has_one :inventory, dependent: :destroy
end
