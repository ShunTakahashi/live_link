require 'rails_helper'

RSpec.describe ActUrl, type: :model do
  let(:band) {create(:devise_band)}
  let(:act) {create(:act, live: create(:live, band_id: band.id))}
  let(:act_url) {create(:act_url, band_id: band.id, act_id: act.id)}
  let(:duplicate_act_url) {build(:act_url, band_id: band.id, act_id: act.id)}

  describe 'バリデーションチェック' do

    it '重複してact_urlにデータが入力されないこと' do
      band
      act
      act_url
      duplicate_act_url
      expect(duplicate_act_url.save).to be_falsey
    end
  end
end