require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "商品出品機能" do
    before do 
      @item = FactoryBot.build(:item)
    end

    context '商品情報の入力がうまく行かない時' do
      it "商品画像を1枚付けないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it "商品名が空だとと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it "商品説明が空だとと登録できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it "カテゴリーの情報が未入力だと登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 0"
      end

      it "商品の状態が未入力だとと登録できない" do
        @item.shipping_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping status must be other than 0"
      end

      it "配送料の情報が未入力だと登録できない" do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost must be other than 0"
      end

      it "発送元の地域情報が未入力だと登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 0"
      end

      it "発送までの日数が未入力だと登録できない" do
        @item.shipping_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping days must be other than 0"
      end
      
      it "販売価格が299円以下だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it "販売価格が10000000円以上だと登録できない" do
        @item.price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it "販売価格が全角文字だと登録できない" do
        @item.price = "あイ１"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it "販売価格が空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it "販売価格が半角英数混合だと登録できない" do
        @item.price = "1a2"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it "販売価格が半角英語だと登録できない" do
        @item.price = "fffff"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end

    context '商品情報の入力がうまく行く時' do
      it "商品情報の入力できる" do
        expect(@item).to be_valid
      end
    end
  end
end