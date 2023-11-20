class Survivor < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_one :inventory, dependent: :destroy
end
