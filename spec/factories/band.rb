FactoryBot.define do
  factory :devise_band, class: Band do
    name {"東京バンド"}
    sequence(:email) {"band1@example.com"}
    prefecture {13}
    password {'12345678'}
    password_confirmation {'12345678'}
  end
end