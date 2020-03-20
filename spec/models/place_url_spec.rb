require 'rails_helper'

RSpec.describe PlaceUrl, type: :model do
  let(:live_house) {create(:devise_live_house)}
  let(:place) {create(:place, live: create(:live, band: create(:devise_band)))}
  let(:place_url) {create(:place_url, place_id: place.id, live_house_id: live_house.id)}
  let(:duplicate_place_url) {build(:place_url, place_id: place.id, live_house_id: live_house.id)}

  describe 'バリデーションチェック' do

    it '重複してact_urlにデータが入力されないこと' do
      live_house
      place
      place_url
      duplicate_place_url
      expect(duplicate_place_url.save).to be_falsey
    end
  end
end