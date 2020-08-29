class TheNearestStation < ApplicationRecord
  belongs_to :property

  validates :station_name, presence: true, if: :minuites_on_foot?
  validates :minuites_on_foot, numericality: true
end
