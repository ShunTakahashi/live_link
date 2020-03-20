require 'rails_helper'

RSpec.describe 'FollowBnad', type: :system do
  before do
    create(:devise_user)
    create(:devise_band)
  end

  describe 'バンドフォローテスト' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'user1@example.com'
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
end