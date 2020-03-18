require 'rails_helper'

RSpec.describe GoingToLive, type: :model do
  let(:user) {create(:devise_user)}
  let(:band) {create(:devise_band)}
  let(:live) {create(:live)}
  let(:going_to_live) {create(:going_to_live)}
  let(:false_going_to_live) {build(:false_going_to_live)}

  describe 'バリデーションチェック' do

    it '重複してgoing_to_liveにデータが入力されないこと' do
      user
      band
      live
      going_to_live
      false_going_to_live
      expect(false_going_to_live.save).to be_falsey
    end
  end
end