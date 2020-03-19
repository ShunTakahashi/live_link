FactoryBot.define do
  factory :place_url, class: PlaceUrl do
    place_id {'1'}
    live_house_id {'1'}
  end

  factory :false_place_url, class: PlaceUrl do
    place_id {'1'}
    live_house_id {'1'}
  end
end