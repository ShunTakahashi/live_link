require 'rails_helper'

RSpec.describe PlaceUrl, type: :model do
  let(:band) {create(:devise_band)}
  let(:live_house) {create(:devise_live_house)}
  let(:place) {create(:place, live: create(:live))}
  let(:place_url) {create(:place_url)}
  let(:false_place_url) {build(:false_place_url)}

  describe 'バリデーションチェック' do

    it '重複してact_urlにデータが入力されないこと' do
      band
      live_house
      place
      place_url
      false_place_url
      expect(false_place_url.save).to be_falsey
    end
  end
end