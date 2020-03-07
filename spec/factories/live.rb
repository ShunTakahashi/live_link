FactoryBot.define do
  factory :live, class: 'Live' do
    id {'1'}
    band_id {'1'}
    title {'test1'}
    date {'2020/10/01'}
    open_time {'12:00'}
    start_time {'13:00'}
    end_time {'18:00'}
    early_bird_ticket_price {'1500'}
    tickets_for_today_price {'2000'}
  end
end