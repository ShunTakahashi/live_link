class User < ApplicationRecord
  # association
  has_many :going_to_lives, class_name: "GoingToLive", dependent: :destroy
  has_many :user_to_lives, through: :going_to_lives, source: :live, class_name: "Live"

  has_many :follow_bands
  has_many :user_to_bands, through: :follow_bands, source: :band

  # devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates
  include DeviseValidators
  validates :ticket_name, presence: true
end
