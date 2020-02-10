class Act < ApplicationRecord
  belongs_to :live, class_name: "Live"

  has_many :act_urls, dependent: :destroy
  has_many :bands, through: :act_urls, source: :band
end
