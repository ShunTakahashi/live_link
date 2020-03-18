require 'rails_helper'

RSpec.describe LiveHouse, type: :model do
  let(:address) {create(:address, live_house: create(:devise_live_house))}

  describe 'バリデーションチェック' do

    it 'Addressが空だと失敗すること' do
      address.address = ''
      address.valid?
      expect(address.errors[:address]).to include('を入力してください')
    end

    it '全て正しく登録されてれば成功すること' do
      expect(address).to be_valid
    end

  end
end