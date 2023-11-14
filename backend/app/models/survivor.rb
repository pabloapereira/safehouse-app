class Survivor < ApplicationRecord
  has_one :location, dependent: :destroy
  has_one :inventory, dependent: :destroy
end
