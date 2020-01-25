class Live < ApplicationRecord
  belongs_to :band, class_name: "Band"
  has_many :act
  accepts_nested_attributes_for :act

  has_many :place
  accepts_nested_attributes_for :place

  has_many :going_to_lives, class_name: "GoingToLive", dependent: :destroy
  has_many :going_to_lives, through: :going_to_lives

  mount_uploader :image, ImageUploader
  mount_uploader :time_table_image, ImageUploader
  validates :title, length: {maximum: 100}
  with_options presence: true do
    validates :title
    validates :date
    validates :early_bird_ticket_price
    validates :tickets_for_today_price
    validates :status
  end
end
