require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, item_id: item.id, user_id: user.id)
    sleep 0.1
  end

    describe '購入機能' do
      context '商品の購入ができる時' do
        it '全ての必須項目が入力されている時購入できる' do
          expect(@item_order).to be_valid
        end

        it 'buildingがなくても購入できる' do
          @item_order.building = nil
          expect(@item_order).to be_valid
        end

      end

      context '商品の購入ができない時' do
        it 'tokenが空では購入できない' do
          @item_order.token = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Token can't be blank")
        end

        it 'postal_codeが空では空では購入できない' do
          @item_order.postal_code = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Postal code can't be blank"
        end

        it '郵便情報にはハイフンがなければ購入できない' do
          @item_order.postal_code = "1234567"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Postal code is invalid"
        end

        it 'postal_codeはハイフンを入れて8文字でなければ購入できない' do
          @item_order.postal_code = "1111111"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Postal code is the wrong length (should be 8 characters)"
        end

        it 'prefecture_idが1では購入できない' do
          @item_order.prefecture_id = 1
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Prefecture must be other than 1"
        end

        it 'cityが空では購入できない' do
          @item_order.city = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "City can't be blank"
        end

        it 'streetが空では購入できない' do
          @item_order.street = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Street can't be blank"
        end

        it 'phone_numberが空では購入できない' do
          @item_order.phone_number = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Phone number can't be blank"
        end

        it '電話番号は11桁以内の数値のみ保存可能' do
          @item_order.phone_number = "090123456789"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Phone number is invalid"
        end

        it '電話番号が半角数字のみでないと登録できない' do
          @item_order.phone_number = "０９０１２３４５６７８"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Phone number is invalid"
        end

        it 'user_idが空では購入できない' do
          @item_order.user_id = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "User can't be blank"
        end

        it 'item_idが空では購入できない' do
          @item_order.item_id = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Item can't be blank"
        end
     end
   end
end