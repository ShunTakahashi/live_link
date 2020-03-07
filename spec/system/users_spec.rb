require 'rails_helper'

RSpec.describe 'User', type: :system do
  before do
    FactoryBot.create(:devise_user)
    FactoryBot.create(:devise_band)
  end

  describe "アカウント作成" do
    it 'アカウントが作成され、同時にログインされること' do
      visit new_user_registration_path
      fill_in 'email', with: "testtt@sample.com"
      fill_in 'user_name', with: 'true'
      fill_in 'ticket_name', with: 'ticket_true'
      fill_in 'new_password', with: 'password'
      fill_in 'password_confirmation', with: 'password'
      click_on '登録する'
      expect(page).to have_content 'My Page'
    end
  end

  describe "ログイン" do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: "user1@example.com"
      fill_in 'パスワード', with: '12345678'
      click_on 'ログイン'
    end

    it '正しくログインされ、ヘッダー部にMy_Pageリンクが現れること' do
      expect(page).to have_content 'My Page'
    end

    it 'ログインページが正しく表示されていること' do
      visit user_path(1)
      expect(page).to have_content 'user1'
    end

    it '正しくログアウトできること' do
      visit user_path(1)
      click_on 'ログアウト'
      expect(page).not_to have_content 'My Page'
    end
  end

  describe 'バンドフォローテスト' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: "user1@example.com"
      fill_in 'パスワード', with: '12345678'
      click_on 'ログイン'
    end

    it 'バンドフォローができる事' do
      visit bands_path
      click_on '東京バンド'
      click_on 'フォロー'
      visit bands_path
      click_on '東京バンド'
      expect(page).to have_content 'フォロー解除'
    end

    it 'バンドフォロー一覧がマイページに表示される' do
      visit bands_path
      click_on '東京バンド'
      click_on 'フォロー'
      click_on 'My Page'
      click_on '1'
      expect(page).to have_content '東京バンド'
    end

    it 'バンドフォロー解除する' do
      visit bands_path
      click_on '東京バンド'
      click_on 'フォロー'
      visit bands_path
      click_on '東京バンド'
      click_on 'フォロー解除'
      visit bands_path
      click_on '東京バンド'
      expect(page).to have_content 'フォロー'
    end
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
      click_on 'いくて良いボタン'
    end
  end
end