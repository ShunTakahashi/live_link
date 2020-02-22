module DeviseValidators
  extend ActiveSupport::Concern

  included do
    with_options presence: true do
      validates :name, :email
    end
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :name, length: {maximum: 30}
  end
end