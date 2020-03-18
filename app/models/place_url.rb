class PlaceUrl < ApplicationRecord
  belongs_to :place
  belongs_to :live_house
  validates_uniqueness_of :place_id, scope: :live_house_id
end
