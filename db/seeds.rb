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
      email: 'user1@user',
      password: 'testtest',
      name: 'テスト1',
      ticket_name: 'テスト1',
    },
    {
      email: 'user2@user',
      password: 'testtest',
      name: 'テスト2',
      ticket_name: 'テスト2'
    }
  ]
)

Band.create!(
  [
    {
      email: 'band1@band',
      password: 'testtest',
      name: 'バンド1',
      prefecture: 1,
    },
    {
      email: 'band2@band',
      password: 'testtest',
      name: 'バンド2',
      prefecture: 1,
    },
    {
      email: 'band3@band',
      password: 'testtest',
      name: 'バンド3',
      prefecture: 1,
    }
  ]
)

LiveHouse.create!(
  [
    {
      email: 'live1@live',
      password: 'testtest',
      name: '渋谷',
      tel: '1',
      prefecture: 1,
      address: 'sample',
    },
    {
      email: 'live2@live',
      password: 'testtest',
      name: '新宿',
      tel: '1',
      prefecture: 2,
      address: 'sample',
    },
    {
      email: 'live3@live',
      password: 'testtest',
      name: '原宿',
      tel: '1',
      prefecture: 3,
      address: 'sample',
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
      status: 1
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
      status: 1
    }
  ]
)

Place.create!(
  [
    {
      id: 1,
      live_id: 1,
      name: '渋谷'
    },
    {
      id: 2,
      live_id: 2,
      name: '新宿'
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
