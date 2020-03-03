FactoryBot.define do
  factory :devise_user, class: User do
    name {"user1"}
    ticket_name {"ticket_user1"}
    sequence(:email) {"user1@example.com"}
    password {'12345678'}
    password_confirmation {'12345678'}
  end
end