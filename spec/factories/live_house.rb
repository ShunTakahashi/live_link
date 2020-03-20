FactoryBot.define do
  factory :devise_live_house, class: LiveHouse do
    name {'渋谷サイクロン'}
    sequence(:email) {'live1@example.com'}
    tel {'09012345678'}
    prefecture {13}
    password {'12345678'}
    password_confirmation {'12345678'}
  end
end