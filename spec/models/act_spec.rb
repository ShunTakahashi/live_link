require 'rails_helper'

RSpec.describe Live, type: :model do
  let(:band) {create(:devise_band)}
  let(:live) {create(:live, band_id: band.id)}
  let(:act) {create(:act, live_id: live.id)}

  describe 'バリデーションチェック' do

    it 'Actが空だと失敗すること' do
      act.name = ''
      act.valid?
      expect(act.errors[:name]).to include('を入力してください')
    end

    it '全て正しく登録されてれば成功すること' do
      expect(live).to be_valid
    end
  end
end