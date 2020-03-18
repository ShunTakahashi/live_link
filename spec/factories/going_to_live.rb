FactoryBot.define do
  factory :going_to_live, class: GoingToLive do
    user_id {'1'}
    live_id {'1'}
  end

  factory :false_going_to_live, class: GoingToLive do
    user_id {'1'}
    live_id {'1'}
  end
end