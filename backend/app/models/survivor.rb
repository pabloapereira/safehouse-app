class Survivor < ApplicationRecord
  has_many :location, dependent: :destroy
  has_one :inventory, dependent: :destroy
end
