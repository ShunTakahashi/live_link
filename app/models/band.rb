class Band < ApplicationRecord
  has_many :lives, class_name: "Live"
  has_many :follow_bands
  has_many :follow_bands, through: :follow_bands, source: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
