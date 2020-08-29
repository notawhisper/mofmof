class CreateTheNearestStations < ActiveRecord::Migration[5.2]
  def change
    create_table :the_nearest_stations do |t|
      t.string :line_name
      t.string :station_name
      t.integer :minuites_on_foot

      t.timestamps
    end
  end
end
