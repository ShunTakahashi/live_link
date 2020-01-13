class Live < ApplicationRecord
  belongs_to :band, class_name: "Band"
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
