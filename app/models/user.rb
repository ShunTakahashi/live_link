class User < ApplicationRecord
  has_many :going_to_lives, class_name: "GoingToLive", dependent: :destroy
  has_many :lives, through: :going_to_lives, class_name: "Live"

  has_many :follow_bands
  has_many :bands, through: :follow_bands, source: :band
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
