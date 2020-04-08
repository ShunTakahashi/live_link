# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(
  [
    {
      email: 'user1@user.com',
      password: '111111',
      name: 'テストユーザー',
      ticket_name: 'テストユーザー',
    }
  ]
)

Band.create!(
  [
    {
      email: 'band1@band.com',
      password: '111111',
      name: '東京テストバンド',
      prefecture: 13,
    },
    {
      email: 'band2@band.com',
      password: '111111',
      name: '神奈川テストバンド',
      prefecture: 14,
    },
    {
      email: 'band3@band.com',
      password: '111111',
      name: '大分テストバンド',
      prefecture: 44,
    }
  ]
)

LiveHouse.create!(
  [
    {
      email: 'live1@live.com',
      password: '111111',
      name: '東京テストライブハウス',
      tel: '09011112222',
      prefecture: 13,
    },
    {
      email: 'live2@live.com',
      password: '111111',
      name: '神奈川テストライブハウス',
      tel: '09022223333',
      prefecture: 14,
    },
    {
      email: 'live3@live.com',
      password: '111111',
      name: '大分テストライブハウス',
      tel: '09033334444',
      prefecture: 44,
    }
  ]
)

Address.create!(
  [
    {
      address: '東京',
      latitude: 35.6804,
      longitude: 139.769017,
      live_house_id: 1,
    },
    {
      address: '神奈川',
      latitude: 35.491354,
      longitude: 139.284143,
      live_house_id: 2,
    },
    {
      address: '大分',
      latitude: 33.15893,
      longitude: 131.361112,
      live_house_id: 3,
    }
  ]
)

(1..3).each do |n|
  Live.create!(
    [
      {
        id: n,
        band_id: 1,
        title: "test#{n}",
        date: '2020/10/01',
        open_time: '12:00',
        start_time: '13:00',
        end_time: '18:00',
        early_bird_ticket_price: 1500,
        tickets_for_today_price: 2000,
      }
    ]
  )
  Place.create!(
    [
      {
        id: n,
        live_id: n,
        name: '東京テストライブハウス',
        url: '/live_houses/1'
      }
    ]
  )
  PlaceUrl.create!(
    [
      {
        id: n,
        place_id: n,
        live_house_id: 1
      }
    ]
  )
  Act.create!(
    [
      {
        id: n,
        live_id: n,
        name: '東京テストバンド',
        url: '/bands/1'
      }
    ]
  )
  ActUrl.create!(
    [
      {
        id: n,
        act_id: n,
        band_id: 1
      }
    ]
  )
end

(4..6).each do |n|
  Live.create!(
    [
      {
        id: n,
        band_id: 2,
        title: "test#{n}",
        date: '2020/10/01',
        open_time: '12:00',
        start_time: '13:00',
        end_time: '18:00',
        early_bird_ticket_price: 1500,
        tickets_for_today_price: 2000,
      }
    ]
  )
  Place.create!(
    [
      {
        id: n,
        live_id: n,
        name: '神奈川テストライブハウス',
        url: '/live_houses/2'
      }
    ]
  )
  PlaceUrl.create!(
    [
      {
        id: n,
        place_id: n,
        live_house_id: 2
      }
    ]
  )
  Act.create!(
    [
      {
        id: n,
        live_id: n,
        name: '神奈川テストバンド',
        url: '/bands/2'
      }
    ]
  )
  ActUrl.create!(
    [
      {
        id: n,
        act_id: n,
        band_id: 2
      }
    ]
  )
end

(7..9).each do |n|
  Live.create!(
    [
      {
        id: n,
        band_id: 3,
        title: "test#{n}",
        date: "2020/10/0#{n}",
        open_time: '12:00',
        start_time: '13:00',
        end_time: '18:00',
        early_bird_ticket_price: 1500,
        tickets_for_today_price: 2000,
      }
    ]
  )
  Place.create!(
    [
      {
        id: n,
        live_id: n,
        name: '大分テストライブハウス',
        url: '/live_houses/3'
      }
    ]
  )
  PlaceUrl.create!(
    [
      {
        id: n,
        place_id: n,
        live_house_id: 3
      }
    ]
  )
  Act.create!(
    [
      {
        id: n,
        live_id: n,
        name: '大分テストバンド',
        url: '/bands/3'
      }
    ]
  )
  ActUrl.create!(
    [
      {
        id: n,
        act_id: n,
        band_id: 3
      }
    ]
  )
end
