class Live < ApplicationRecord
  # association
  belongs_to :band, class_name: "Band"
  has_many :act, dependent: :destroy
  accepts_nested_attributes_for :act, allow_destroy: true

  has_many :place, dependent: :destroy
  accepts_nested_attributes_for :place, allow_destroy: true

  has_many :going_to_lives, class_name: "GoingToLive", dependent: :destroy
  has_many :users, through: :going_to_lives

  # image_uploader
  mount_uploader :image, ImageUploader
  mount_uploader :time_table_image, ImageUploader

  # validates
  validates :title, length: {maximum: 100}
  validates :title, :date, :status, presence: true
  validates :early_bird_ticket_price, :tickets_for_today_price,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if date.present? && date.past?
      errors.add(:date, 'に過去は登録できません')
    end
  end
end
