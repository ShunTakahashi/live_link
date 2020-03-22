class Address < ApplicationRecord
  # association
  belongs_to :live_house

  # Google Map API
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # validates
  validates :address, presence: true

  def self.guest(params)
    find_or_create_by!(address: '東京', live_house_id: params)
  end
end
