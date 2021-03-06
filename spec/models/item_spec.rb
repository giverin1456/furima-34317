require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 describe '商品出品機能' do
  context '商品の出品ができる時' do
    it '全ての項目が入力されていれば登録できる' do
      expect(@item).to be_valid
    end
   end

   context '商品の出品ができない時' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it '商品の説明が空ではでは登録できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Text can't be blank"
    end
    it 'category_idが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
    end
    it 'status_idが1では登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Status must be other than 1"
    end
    it 'delivery_charge_idが1では登録できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery charge must be other than 1"
    end
    it 'prefecture_idが1では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
    end
    it 'day_idが1では登録できない' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Day must be other than 1"
    end
    it '販売価格が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '販売価格が¥300以下であれば登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than 300"
    end
    it '販売価格が¥9,999,999以上なら登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than 9999999"
    end
    it '販売価格は半角数字でなければ登録できない' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it '販売価格が半角英数混合では登録できない' do
      @item.price = '123abc'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it '販売価格が半角英語では登録できない' do
      @item.price = 'aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it 'userが紐付いていないと登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
   end
  end
end