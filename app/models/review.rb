class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property, counter_cache: true

  validates :content, presence: :true
  validates :cleaniness_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, lest_than_or_equal_to: 5 }
  validates :accuracy_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, lest_than_or_equal_to: 5 }
  validates :checkin_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, lest_than_or_equal_to: 5 }
  validates :communication_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, lest_than_or_equal_to: 5 }
  validates :location_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, lest_than_or_equal_to: 5 }
  validates :value_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, lest_than_or_equal_to: 5 }

  after_commit :update_final_rating, on: [ :create, :update ]

  def update_final_rating
    total_points = cleaniness_rating + accuracy_rating + checkin_rating + communication_rating + location_rating + value_rating

    update_column(:final_rating, total_points/6.0)

    property.update_average_rating
  end
end
