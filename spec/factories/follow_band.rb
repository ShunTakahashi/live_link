FactoryBot.define do
  factory :follow_band, class: FollowBand do
    user_id {'1'}
    band_id {'1'}
  end

  factory :false_follow_band, class: FollowBand do
    user_id {'1'}
    band_id {'1'}
  end
end