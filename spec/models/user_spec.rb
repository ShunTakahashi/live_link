require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {build(:devise_user)}

  describe 'バリデーションチェック' do

    it 'Nameが空だと失敗すること' do
      user.name = ''
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end

    it 'Nameが31文字以上だと失敗すること' do
      user.name = ('a' * 31)
      user.valid?
      expect(user.errors[:name]).to include('は30文字以内で入力してください')
    end

    it 'Ticket_Nameが空だと失敗すること' do
      user.ticket_name = ''
      user.valid?
      expect(user.errors[:ticket_name]).to include('を入力してください')
    end

    it 'Ticket_Nameが31文字以上だと失敗すること' do
      user.ticket_name = ('a' * 31)
      user.valid?
      expect(user.errors[:ticket_name]).to include('は30文字以内で入力してください')
    end

    it 'Emailが空だと失敗すること' do
      user.email = ''
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'Emailが重複していると失敗すること' do
      User.create(email: 'foo@example.com')
      @user = User.create(email: 'foo@example.com')
      expect(@user.save).to be_falsey
    end

    it 'Passwordが空だと失敗すること' do
      expect(FactoryBot.build(:devise_user, password: "")).to_not be_valid
    end

    it 'Passwordが6文字以内だと失敗すること' do
      @user = FactoryBot.build(:devise_user, password: "a" * 5, password_confirmation: "a" * 5)
      expect(@user).to be_invalid
    end

    it 'PasswordとPassword_confirmationが一致しなければ失敗すること' do
      @user = FactoryBot.build(:devise_user, password: "a" * 9, password_confirmation: "a" * 10)
      expect(@user).to be_invalid
    end

    it '全て正しく登録されてれば成功すること' do
      expect(user).to be_valid
    end

  end
end