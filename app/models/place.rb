class Place < ApplicationRecord
  belongs_to :live, class_name: "Live"


  has_many :place_urls, dependent: :destroy
  has_many :place_to_live_houses, through: :place_urls, source: :live_house

  validates :name, presence: true
end
