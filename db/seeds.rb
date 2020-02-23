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
      password: 'testtest',
      name: 'テスト1',
      ticket_name: 'テスト1',
    },
    {
      email: 'user2@user.com',
      password: 'testtest',
      name: 'テスト2',
      ticket_name: 'テスト2'
    }
  ]
)

Band.create!(
  [
    {
      email: 'band1@band.com',
      password: 'testtest',
      name: 'バンド1',
      prefecture: 1,
    },
    {
      email: 'band2@band.com',
      password: 'testtest',
      name: 'バンド2',
      prefecture: 1,
    },
    {
      email: 'band3@band.com',
      password: 'testtest',
      name: 'バンド3',
      prefecture: 1,
    }
  ]
)

LiveHouse.create!(
  [
    {
      email: 'live1@live.com',
      password: 'testtest',
      name: '渋谷サイクロン',
      tel: '1',
      prefecture: 13,
    },
    {
      email: 'live2@live.com',
      password: 'testtest',
      name: '新宿サイエンス',
      tel: '1',
      prefecture: 13,
    },
    {
      email: 'live3@live.com',
      password: 'testtest',
      name: '大分T.O.P.S',
      tel: '1',
      prefecture: 44,
    }
  ]
)

Address.create!(
  [
    {
      address: '東京都渋谷区宇田川町13-16 コクサイビルＡ館',
      latitude: 35.661461,
      longitude: 139.698408,
      live_house_id: 1,
    },
    {
      address: "東京都新宿区歌舞伎町2丁目25−6 B1",
      latitude: 35.695503,
      longitude: 139.703556,
      live_house_id: 2,
    },
    {
      address: "大分県大分市生石5丁目3-783",
      latitude: 33.247542,
      longitude: 131.587605,
      live_house_id: 3,
    }
  ]
)

Live.create!(
  [
    {
      id: 1,
      band_id: 1,
      title: 'test1',
      date: '2020/10/01',
      open_time: '12:00',
      start_time: '13:00',
      end_time: '18:00',
      early_bird_ticket_price: 1500,
      tickets_for_today_price: 2000,
    },
    {
      id: 2,
      band_id: 1,
      title: 'test2',
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
      id: 1,
      live_id: 1,
      name: '渋谷サイクロン'
    },
    {
      id: 2,
      live_id: 2,
      name: '新宿サイエンス'
    }
  ]
)

PlaceUrl.create!(
  [
    {
      place_id: 1,
      live_house_id: 1
    },
    {
      place_id: 2,
      live_house_id: 2
    }
  ]
)

Act.create!(
  [
    {
      live_id: 1,
      name: 'バンド1'
    },
    {
      live_id: 2,
      name: 'バンド2'
    }
  ]
)

ActUrl.create!(
  [
    {
      band_id: 1,
      act_id: 1
    },
    {
      band_id: 2,
      act_id: 2
    }
  ]
)
