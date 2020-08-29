class Property < ApplicationRecord
  has_many :the_nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :the_nearest_stations, allow_destroy: true
end
