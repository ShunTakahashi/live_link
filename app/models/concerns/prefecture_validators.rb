module PrefectureValidators
  extend ActiveSupport::Concern

  included do
    validates :prefecture, presence: true
  end
end