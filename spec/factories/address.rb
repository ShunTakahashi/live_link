FactoryBot.define do
  factory :address, class: 'Address' do
    live_house_id {"1"}
    address {'東京都渋谷区宇田川町13-16 コクサイビルA館'}
  end
end