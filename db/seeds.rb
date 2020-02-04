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
      password: '0116syun',
      name: 'テスト1',
      ticket_name: 'テスト1',
    },
    {
      email: 'user2@user',
      password: '0116syun',
      name: 'テスト2',
      ticket_name: 'テスト2'
    }
  ]
)

Band.create!(
  [
    {
      email: 'band1@band',
      password: '0116syun',
      name: 'バンド1',
      prefecture: 1,
    },
    {
      email: 'band2@band',
      password: '0116syun',
      name: 'バンド2',
      prefecture: 1,
    },
    {
      email: 'band3@band',
      password: '0116syun',
      name: 'バンド3',
      prefecture: 1,
    }
  ]
)

LiveHouse.create!(
  [
    {
      email: 'live1@live',
      password: '0116syun',
      name: '渋谷',
      tel: '1',
      prefecture: 1,
      address: 'sample',
    },
    {
      email: 'live2@live',
      password: '0116syun',
      name: '新宿',
      tel: '1',
      prefecture: 1,
      address: 'sample',
    },
    {
      email: 'live3@live',
      password: '0116syun',
      name: '原宿',
      tel: '1',
      prefecture: 1,
      address: 'sample',
    }
  ]
)

