class FollowBand < ApplicationRecord
  belongs_to :user
  belongs_to :band
end
