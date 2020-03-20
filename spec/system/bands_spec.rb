require 'rails_helper'

RSpec.describe 'Band', type: :system do
  before do
    create(:devise_band)
  end

  describe 'アカウント作成が正しくされる事' do
    it 'アカウントが作成され、同時にログインされること' do
      visit new_band_registration_path
      fill_in 'band_email', with: 'testband@sample.com'
      fill_in 'band_name', with: '東京バンド'
      select '東京都', from: 'band_prefecture'
      fill_in 'band_password', with: 'password'
      fill_in 'band_password_confirmation', with: 'password'
      click_on '登録する'
      expect(page).to have_content 'My Page'
    end
  end

  describe 'ログイン,ログアウト機能が正しく機能する事' do
    before do
      visit new_band_session_path
      fill_in 'メールアドレス', with: 'band1@example.com'
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

  describe 'バンド検索が正しく機能すること' do
    it 'バンド検索で検索対象バンドが表示される事' do
      visit bands_path
      fill_in 'search_band', with: '東京バンド'
      expect(page).to have_content '東京バンド'
    end

    it '活動地域検索で対象地域で活動中のバンドが表示される事' do
      visit bands_path
      select '東京都', from: 'search_prefecture'
      expect(page).to have_content '東京バンド'
    end
  end
end