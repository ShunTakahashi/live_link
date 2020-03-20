require 'rails_helper'

RSpec.describe GoingToLive, type: :model do
  let(:user) {create(:devise_user)}
  let(:band) {create(:devise_band)}
  let(:live) {create(:live, band_id: band.id)}
  let(:going_to_live) {create(:going_to_live, user_id: user.id, live_id: live.id)}
  let(:duplicate_going_to_live) {build(:going_to_live, user_id: user.id, live_id: live.id)}

  describe 'バリデーションチェック' do

    it '重複してgoing_to_liveにデータが入力されないこと' do
      user
      band
      live
      going_to_live
      duplicate_going_to_live
      expect(duplicate_going_to_live.save).to be_falsey
    end
  end
end