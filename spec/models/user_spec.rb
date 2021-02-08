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
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "name_kanaが空では登録できない" do
      @user.name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana can't be blank"
    end
    it "birth_dayが空では登録できない" do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
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
    it "passwordが数字だけでは登録できない" do
      @user.password = FactoryBot.build(:user, password: "1234567", password_confirmation: "1234567")
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "passwordがアルファベットだけでは登録できない" do
      @user.password = FactoryBot.build(:user, password: "abcdefg", password_confirmation: "abcdefg")
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "password２つが同じでないと登録できない" do
      @user.password = "1234567"
      @user.password_confirmation = "yoshida"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid", "Password confirmation is invalid"
    end
    it "first_nameが全角でないと登録できない" do
      @user.first_name = FactoryBot.build(:user, first_name: "yoshida")
      @user.valid?
      expect(@user.errors.full_messages).to include "First name Full-width characters"
    end
    it "nameが全角でないと登録できない" do
      @user.name = FactoryBot.build(:user, name: "yoshida")
      @user.valid?
      expect(@user.errors.full_messages).to include "Name Full-width characters"
    end
    it "first_name_kanaが全角カタカナでないと登録できない" do
      @user.first_name_kana = FactoryBot.build(:user, first_name_kana: "yoshida")
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana Full-width katakana characters"
    end
    it "name_kanaが全角カタカナでないと登録できない" do
      @user.name_kana = FactoryBot.build(:user, name_kana: "yoshida")
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana Full-width katakana characters"
    end
  end
end