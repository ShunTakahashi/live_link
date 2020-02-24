class GoingToLive < ApplicationRecord
  belongs_to :user
  belongs_to :live
  validates_uniqueness_of :live_id, scope: :user_id
end
