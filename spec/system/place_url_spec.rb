require 'rails_helper'

RSpec.describe 'PlaceUrl', type: :system do
  before do
    create(:address, live_house: create(:devise_live_house))
    create(:devise_band)
    visit new_band_session_path
    fill_in 'メールアドレス', with: 'band1@example.com'
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
  end

  describe '自動リンク機能が正しく効いている事' do
    it 'バンド名をクリックするとバンド詳細ページに飛べること' do
      visit lives_path
      click_on 'テスト1'
      click_on '渋谷サイクロン'
      expect(page).to have_content '渋谷サイクロン'
    end
  end

  describe 'バリデーションチェック' do
    it 'actが空だと失敗すること' do
      visit new_live_path
      fill_in 'live_title', with: 'テスト1'
      fill_in 'act_name', with: '東京バンド'
      fill_in 'live_date', with: '2020/10/19'
      fill_in 'live_open_time', with: '17:00'
      fill_in 'live_start_time', with: '17:30'
      fill_in 'live_end_time', with: '21:00'
      fill_in 'live_early_bird_ticket_price', with: '2500'
      fill_in 'live_tickets_for_today_price', with: '3000'
      click_on '登録する'
      expect(page).to have_content 'ライブハウス名を入力してください'
    end
  end
end
