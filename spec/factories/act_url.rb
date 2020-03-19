FactoryBot.define do
  factory :act_url, class: ActUrl do
    act_id {'1'}
    band_id {'1'}
  end

  factory :false_act_url, class: ActUrl do
    act_id {'1'}
    band_id {'1'}
  end
end