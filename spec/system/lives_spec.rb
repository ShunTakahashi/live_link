require 'rails_helper'

RSpec.describe 'Live', type: :system do
  before do
    FactoryBot.create(:address, live_house: FactoryBot.create(:devise_live_house))
    FactoryBot.create(:devise_band)
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
    expect(page).to have_content 'テスト1'

  end

  describe "ライブ情報投稿から詳細ページ" do
    it 'ライブ情報が正しく投稿される事' do
      visit new_live_path
      fill_in 'live_title', with: 'テスト1'
      fill_in 'place', with: '渋谷サイクロン'
      fill_in 'live_date', with: '2020/10/19'
      fill_in 'act_name', with: 'バンド1'
      fill_in 'live_open_time', with: '17:00'
      fill_in 'live_start_time', with: '17:30'
      fill_in 'live_end_time', with: '21:00'
      fill_in 'live_early_bird_ticket_price', with: '2500'
      fill_in 'live_tickets_for_today_price', with: '3000'
      click_on '登録する'
      expect(page).to have_content 'テスト1'
    end

    it 'ライブ詳細ページを表示できること' do
      visit lives_path
      click_on 'テスト1'
      expect(page).to have_content '渋谷サイクロン'
    end

    it 'ライブ詳細ページからライブハウス詳細ページへ飛べる事' do
      visit lives_path
      click_on 'テスト1'
      click_on '渋谷サイクロン'
      expect(page).to have_content '東京都'
    end

    it 'ライブ詳細ページからバンド詳細ページに飛べる事' do
      visit lives_path
      click_on 'テスト1'
      click_on '東京バンド'
      expect(page).to have_content '東京バンド'
    end
  end
end