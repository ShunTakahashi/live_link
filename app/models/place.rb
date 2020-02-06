class Place < ApplicationRecord
  belongs_to :live, class_name: "Live"

  has_many :place_urls
  has_many :live_house, through: :place_urls
end
