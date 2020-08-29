class AddPropertyRefToTheNearestStations < ActiveRecord::Migration[5.2]
  def change
    add_reference :the_nearest_stations, :property, foreign_key: true
  end
end
