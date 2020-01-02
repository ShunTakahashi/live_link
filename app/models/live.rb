class Live < ApplicationRecord
  validates :title, maximum: 100
  with_options presence: true do
    validates :title
    validates :date
    validates :early_bird_ticket_price
    validates :tickets_for_today_price
    validates :status
  end
end
