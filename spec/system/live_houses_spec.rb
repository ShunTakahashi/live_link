require 'rails_helper'

RSpec.describe 'LiveHouse', type: :system do
  before do
    FactoryBot.create(:address, live_house: create(:devise_live_house))
  end

  describe 'アカウント作成が正しく機能する事' do
    it 'アカウントが作成され、同時にログインされること' do
      visit new_live_house_registration_path
      fill_in 'live_house_email', with: 'testlive_house@sample.com'
      fill_in 'live_house_name', with: '渋谷サイクロン'
      fill_in 'live_house_tel', with: '09012345678'
      select '東京都', from: 'live_house_prefecture'
      fill_in 'address', with: '東京都渋谷区宇田川町13-16 コクサイビルA館'
      fill_in 'live_house_password', with: 'password'
      fill_in 'live_house_password_confirmation', with: 'password'
      click_on '登録する'
      expect(page).to have_content 'My Page'
    end
  end

  describe 'ログイン,ログアウト機能が正しく実装される事' do
    before do
      visit new_live_house_session_path
      fill_in 'メールアドレス', with: 'live1@example.com'
      fill_in 'パスワード', with: '12345678'
      click_on 'ログイン'
    end

    it '正しくログインされ、ヘッダー部にMy_Pageリンクが現れること' do
      expect(page).to have_content 'My Page'
    end

    it 'ログインページが正しく表示されていること' do
      visit live_house_path(1)
      expect(page).to have_content '渋谷サイクロン'
    end

    it '正しくログアウトできること' do
      visit live_house_path(1)
      click_on 'ログアウト'
      expect(page).not_to have_content 'My Page'
    end
  end

  describe 'ライブハウス検索機能が正しく機能すること' do
    it 'ライブハウス検索で対象名のライブハウスが表示される事' do
      visit live_houses_path
      fill_in 'search_live_house', with: '渋谷サイクロン'
      expect(page).to have_content '渋谷サイクロン'
    end

    it '地域検索で対象地域のライブハウスが表示される事' do
      visit live_houses_path
      select '東京都', from: 'search_prefecture'
      expect(page).to have_content '渋谷サイクロン'
    end
  end
end