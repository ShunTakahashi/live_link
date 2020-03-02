require 'rails_helper'

RSpec.describe 'User', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:test_user)
  end

  describe "アカウント作成" do
    it 'アカウントが作成され、同時にログインされること' do
      visit new_user_path
      fill_in '名前', with: 'true'
      fill_in 'メールアドレス', with: 'testtt@sample'
      fill_in 'パスワード', with: 'password'
      fill_in '確認用パスワード', with: 'password'
      click_on '登録する'
      expect(page).to have_content 'true'
    end
  end
end