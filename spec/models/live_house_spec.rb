require 'rails_helper'

RSpec.describe LiveHouse, type: :model do
  live_house = FactoryBot.build(:devise_live_house, :with_address)

  describe 'バリデーションチェック' do

    it 'Nameが空だと失敗すること' do
      live_house.name = ''
      live_house.valid?
      expect(live_house.errors[:name]).to include('を入力してください')
    end

    it 'Nameが31文字以上だと失敗すること' do
      live_house.name = ('a' * 31)
      live_house.valid?
      expect(live_house.errors[:name]).to include('は30文字以内で入力してください')
    end

    it 'Emailが空だと失敗すること' do
      live_house.email = ''
      live_house.valid?
      expect(live_house.errors[:email]).to include('を入力してください')
    end

    it 'Emailが重複していると失敗すること' do
      LiveHouse.create(email: 'foo@example.com')
      @live_house = LiveHouse.create(email: 'foo@example.com')
      expect(@live_house.save).to be_falsey
    end

    it 'Prefectureが空だと失敗すること' do
      @live_house = FactoryBot.build(:devise_live_house, prefecture: '')
      expect(@live_house).to be_invalid
    end

    it 'Passwordが空だと失敗すること' do
      expect(FactoryBot.build(:devise_live_house, password: "")).to_not be_valid
    end

    it 'Passwordが6文字以内だと失敗すること' do
      @live_house = FactoryBot.build(:devise_live_house, password: "a" * 5, password_confirmation: "a" * 5)
      expect(@live_house).to be_invalid
    end

    it 'PasswordとPassword_confirmationが一致しなければ失敗すること' do
      @live_house = FactoryBot.build(:devise_live_house, password: "a" * 9, password_confirmation: "a" * 10)
      expect(@live_house).to be_invalid
    end

    it '全て正しく登録されてれば成功すること' do
      live_house = FactoryBot.build(:devise_live_house, :with_address)
      expect(live_house).to be_valid
    end

  end
end