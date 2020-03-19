require 'rails_helper'

RSpec.describe 'User', type: :system do
  before do
    FactoryBot.create(:devise_user)
    FactoryBot.create(:devise_band)
  end

  describe "アカウント作成" do
    it 'アカウントが作成され、同時にログインされること' do
      visit new_user_registration_path
      fill_in 'email', with: 'testtt@sample.com'
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
      fill_in 'メールアドレス', with: 'user1@example.com'
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
end