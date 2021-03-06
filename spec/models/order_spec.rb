require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "購入機能" do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

    context '商品購入できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@order).to be_valid
      end
      it '建物名が存在しなくても登録できること' do
        @order.building_name = ""
        expect(@order).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号が空では登録できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Post code can't be blank"
      end

      it '郵便番号が-(ハイフン)が入ってないと登録できない' do
        @order.post_code = "1231234"
        @order.valid?
        expect(@order.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end

      it '市区町村が空では登録できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "City can't be blank"
      end

      it '番地が空では登録できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Address can't be blank"
      end

      it '電話番号の数字以外が混じっていると登録できない' do
        @order.phone_number = "アイウエオ"
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number Input only number"
      end

      it '電話番号12桁以上では登録できない' do
        @order.phone_number = "1234567891234567"
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is invalid"
      end

      it 'トークンが空では登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end

      it "都道府県が未入力だと登録できない" do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture Select"
      end

      it "ユーザーが空だと登録できない" do
        @order.user_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "User can't be blank"
      end

      it "商品が空だと登録できない" do
        @order.item_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end