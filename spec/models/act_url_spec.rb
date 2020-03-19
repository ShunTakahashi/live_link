require 'rails_helper'

RSpec.describe ActUrl, type: :model do
  let(:band) {create(:devise_band)}
  let(:act) {create(:act, live: create(:live))}
  let(:act_url) {create(:act_url)}
  let(:false_act_url) {build(:false_act_url)}

  describe 'バリデーションチェック' do

    it '重複してact_urlにデータが入力されないこと' do
      band
      act
      act_url
      false_act_url
      expect(false_act_url.save).to be_falsey
    end
  end
end