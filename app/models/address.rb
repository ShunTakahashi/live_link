class Address < ApplicationRecord
  # association
  belongs_to :live_house

  # validates
  validates :address, presence: true
end
