class ActUrl < ApplicationRecord
  belongs_to :band
  belongs_to :act
  validates_uniqueness_of :band_id, scope: :act_id
end
