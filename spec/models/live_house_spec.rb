require 'rails_helper'

RSpec.describe LiveHouse, type: :model do
  let(:live_house) {create(:devise_live_house)}
  let(:duplicate_live_house) {build(:devise_live_house)}

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
      live_house
      duplicate_live_house
      expect(duplicate_live_house.save).to be_falsey
    end

    it 'Prefectureが空だと失敗すること' do
      live_house = build(:devise_live_house, prefecture: '')
      expect(live_house.save).to be_falsey
    end

    it 'Telが空だと失敗すること' do
      live_house.tel = ''
      live_house.valid?
      expect(live_house.errors[:tel]).to include('を入力してください')
    end

    it 'Telに数字以外が入ると失敗すること' do
      live_house.tel = '0001111222a'
      live_house.valid?
      expect(live_house.errors[:tel]).to include('は不正な値です')
    end

    it 'Telに電話番号ではない桁数が入力された場合失敗すること' do
      live_house.tel = '000111122223333'
      live_house.valid?
      expect(live_house.errors[:tel]).to include('は不正な値です')
    end

    it 'Telに電話番号ではない数字が入力された場合桁数があっていても失敗すること' do
      live_house.tel = '00011112222'
      live_house.valid?
      expect(live_house.errors[:tel]).to include('は不正な値です')
    end
    
    it 'Passwordが空だと失敗すること' do
      live_house.password = ''
      expect(live_house.save).to be_falsey
    end

    it 'Passwordが6文字以内だと失敗すること' do
      live_house = build(:devise_live_house, password: 'a' * 5, password_confirmation: 'a' * 5)
      expect(live_house.save).to be_falsey
    end

    it 'PasswordとPassword_confirmationが一致しなければ失敗すること' do
      live_house = build(:devise_live_house, password: 'a' * 9, password_confirmation: 'a' * 10)
      expect(live_house.save).to be_falsey
    end

    it '全て正しく登録されてれば成功すること' do
      expect(live_house).to be_valid
    end

  end
end