class Act < ApplicationRecord
  belongs_to :live, class_name: "Live"

  has_many :act_urls, dependent: :destroy
  has_many :act_to_band, through: :act_urls, source: :band
end
