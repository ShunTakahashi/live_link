require 'rails_helper'

RSpec.describe 'User', type: :system do
  before do
    FactoryBot.create(:devise_user)
    FactoryBot.create(:devise_band)
  end
  describe 'ライブのブックマークテスト' do
    before do
      visit new_band_session_path
      fill_in 'メールアドレス', with: "band1@example.com"
      fill_in 'パスワード', with: '12345678'
      click_on 'ログイン'

      visit new_live_path
      fill_in 'live_title', with: 'テスト1'
      fill_in 'place', with: '渋谷サイクロン'
      fill_in 'live_date', with: '2020/10/19'
      fill_in 'act_name', with: '東京バンド'
      fill_in 'live_open_time', with: '17:00'
      fill_in 'live_start_time', with: '17:30'
      fill_in 'live_end_time', with: '21:00'
      fill_in 'live_early_bird_ticket_price', with: '2500'
      fill_in 'live_tickets_for_today_price', with: '3000'
      click_on '登録する'
      click_on 'My Page'
      click_on 'ログアウト'

      visit new_user_session_path
      fill_in 'メールアドレス', with: "user1@example.com"
      fill_in 'パスワード', with: '12345678'
      click_on 'ログイン'
    end

    it 'ライブブックマークができること' do
      visit lives_path
      click_on 'テスト1'
      click_on '行く予定ボタン'
    end
  end
end