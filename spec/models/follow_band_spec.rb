require 'rails_helper'

RSpec.describe GoingToLive, type: :model do
  let(:user) {create(:devise_user)}
  let(:band) {create(:devise_band)}
  let(:follow_band) {create(:follow_band)}
  let(:false_follow_band) {build(:false_follow_band)}

  describe 'バリデーションチェック' do

    it '重複してfollow_bandにデータが入力されないこと' do
      user
      band
      follow_band
      false_follow_band
      expect(false_follow_band.save).to be_falsey
    end
  end
end