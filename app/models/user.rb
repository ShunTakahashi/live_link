class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :going_to_lives, class_name: "GoingToLive", dependent: :destroy
  has_many :lives, through: :going_to_lives
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
