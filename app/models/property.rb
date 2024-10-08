class Property < ApplicationRecord
  # name, headline, description, address_1, city, state, country
  #

  validates :name, :headline, :description, :address_1, :city, :state, presence: :true

  monetize :price_cents, allow_nil: true
end
