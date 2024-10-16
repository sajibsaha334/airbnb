class AddIndexToAmenitiesProperties < ActiveRecord::Migration[7.2]
  def change
    add_index :amenities_properties, [ :amenity_id, :property_id ], unique: true
  end
end
