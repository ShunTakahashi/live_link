require 'rails_helper'

RSpec.describe Band, type: :model do
  let(:band) {create(:devise_band)}
  let(:duplicate_band) {build(:devise_band)}

  describe 'バリデーションチェック' do

    it 'Nameが空だと失敗すること' do
      band.name = ''
      band.valid?
      expect(band.errors[:name]).to include('を入力してください')
    end

    it 'Nameが31文字以上だと失敗すること' do
      band.name = ('a' * 31)
      band.valid?
      expect(band.errors[:name]).to include('は30文字以内で入力してください')
    end

    it 'Emailが空だと失敗すること' do
      band.email = ''
      band.valid?
      expect(band.errors[:email]).to include('を入力してください')
    end

    it 'Emailが重複していると失敗すること' do
      band
      duplicate_band
      expect(duplicate_band.save).to be_falsey
    end
    
    it 'Prefectureが空だと失敗すること' do
      band.prefecture = ''
      expect(band.save).to be_falsey
    end

    it 'Passwordが空だと失敗すること' do
      band.password = ''
      expect(band.save).to be_falsey
    end

    it 'Passwordが6文字以内だと失敗すること' do
      @band = build(:devise_band, password: 'a' * 5, password_confirmation: 'a' * 5)
      expect(@band.save).to be_falsey
    end

    it 'PasswordとPassword_confirmationが一致しなければ失敗すること' do
      @band = build(:devise_band, password: 'a' * 9, password_confirmation: 'a' * 10)
      expect(@band.save).to be_falsey
    end

    it '全て正しく登録されてれば成功すること' do
      expect(band).to be_valid
    end

  end
end