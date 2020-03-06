FactoryBot.define do
  factory :devise_live_house, class: LiveHouse do
    id {'1'}
    name {"渋谷サイクロン"}
    sequence(:email) {"live1@example.com"}
    tel {00011112222}
    prefecture {13}
    password {'12345678'}
    password_confirmation {'12345678'}
  end
end