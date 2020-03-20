require 'rails_helper'

RSpec.describe GoingToLive, type: :model do
  let(:user) {create(:devise_user)}
  let(:band) {create(:devise_band)}
  let(:follow_band) {create(:follow_band, user_id: user.id, band_id: band.id)}
  let(:duplicate_follow_band) {build(:follow_band, user_id: user.id, band_id: band.id)}

  describe 'バリデーションチェック' do

    it '重複してfollow_bandにデータが入力されないこと' do
      user
      band
      follow_band
      duplicate_follow_band
      expect(duplicate_follow_band.save).to be_falsey
    end
  end
end