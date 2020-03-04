require 'rails_helper'

RSpec.describe 'Band', type: :system do
  before do
    FactoryBot.create(:devise_band)
  end

  describe "アカウント作成" do
    it 'アカウントが作成され、同時にログインされること' do
      visit new_band_registration_path
      fill_in 'band_email', with: "testband@sample.com"
      fill_in 'band_name', with: '東京バンド'
      select '東京都', from: 'band_prefecture'
      fill_in 'band_password', with: 'password'
      fill_in 'band_password_confirmation', with: 'password'
      click_on '登録する'
      expect(page).to have_content 'My Page'
    end
  end

  describe "ログイン" do
    before do
      visit new_band_session_path
      fill_in 'メールアドレス', with: "band1@example.com"
      fill_in 'パスワード', with: '12345678'
      click_on 'ログイン'
    end

    it '正しくログインされ、ヘッダー部にMy_Pageリンクが現れること' do
      expect(page).to have_content 'My Page'
    end

    it 'ログインページが正しく表示されていること' do
      visit band_path(1)
      expect(page).to have_content '東京バンド'
    end

    it '正しくログアウトできること' do
      visit band_path(1)
      click_on 'ログアウト'
      expect(page).not_to have_content 'My Page'
    end
  end
end