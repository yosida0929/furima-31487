require 'rails_helper'
RSpec.describe User, type: :model do

  describe "ユーザー新規登録" do
    before do 
      @user = FactoryBot.build(:user)
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "nameが空では登録できない" do
    end
    it "first_name_kanaが空では登録できない" do
    end
    it "name_kanaが空では登録できない" do
    end
    it "birth_dayが空では登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "e-mailで@がないと登録できない" do
      @user.email = "test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "同じemilでは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
  end
end