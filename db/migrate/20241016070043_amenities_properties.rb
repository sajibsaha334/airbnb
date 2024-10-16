class AmenitiesProperties < ActiveRecord::Migration[7.2]
  def change
    create_table :amenities_properties, id: false do |t|
      t.belongs_to :amenity
      t.belongs_to :property
    end
  end
end
