class Amenity < ApplicationRecord
  validates :name, presence: :true
  validates :icon, presence: :true

  has_and_belongs_to_many :properties
end
