class PlaceUrl < ApplicationRecord
  belongs_to :place
  belongs_to :live_house
end
