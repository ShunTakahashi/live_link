class Address < ApplicationRecord
  # association
  belongs_to :live_house

  # Google Map API
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # validates
  validates :address, presence: true
end
