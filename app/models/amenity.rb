class Amenity < ApplicationRecord
  validates :name, presence: :true

  has_one_attached :icon
  has_and_belongs_to_many :properties
end
