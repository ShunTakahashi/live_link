class Address < ApplicationRecord
  # association
  # belongs_to :live_house, class_name: "LiveHouse"
  belongs_to :live_house, inverse_of: :address
  # validates
  validates :address, presence: true
end
