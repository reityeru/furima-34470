require 'rails_helper'

RSpec.describe PurchaseRecordShippingInformation, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_shipping_information = FactoryBot.build(:purchase_record_shipping_information, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '保存できる場合' do
    it '全ての項目が存在すれば購入できる' do
      expect(@purchase_record_shipping_information).to be_valid
    end
    it '建物名が空でも購入できる' do
      @purchase_record_shipping_information.building_name = ""
      expect(@purchase_record_shipping_information).to be_valid
    end
    it '電話番号が10桁の数値のみなら購入できる' do
      @purchase_record_shipping_information.phone_number = "0001010001"
      expect(@purchase_record_shipping_information).to be_valid
    end
    it '電話番号が11桁の数値のみなら購入できる' do
      @purchase_record_shipping_information.phone_number = "09011111111"
      expect(@purchase_record_shipping_information).to be_valid
    end
  end

  context '保存できない場合' do
    it '郵便番号が空では購入できない' do
      @purchase_record_shipping_information.postal_code = ""
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Postal code can't be blank")
    end
    it '都道府県が空では購入できない' do
      @purchase_record_shipping_information.shipping_area_id = ""
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Shipping area can't be blank", "Shipping area is not a number")
    end
    it '市町村区が空では購入できない' do
      @purchase_record_shipping_information.municipality = ""
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空では購入できない' do
      @purchase_record_shipping_information.address = ""
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空では購入できない' do
      @purchase_record_shipping_information.phone_number = ""
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が数値以外では購入できない' do
      @purchase_record_shipping_information.phone_number = "abcdefghijk"
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が9桁以下では購入できない' do
      @purchase_record_shipping_information.phone_number = "123456789"
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が12桁以上では購入できない' do
      @purchase_record_shipping_information.phone_number = "123456789012"
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Phone number is invalid")
    end
    it '都道府県の選択が「---」では購入できない' do
      @purchase_record_shipping_information.shipping_area_id = 1
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Shipping area must be other than 1")
    end
    it 'ユーザーに紐ついてなければ購入できない' do
      @purchase_record_shipping_information.user_id = nil
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("User can't be blank")
    end
    it '商品に紐ついてなければ購入できない' do
      @purchase_record_shipping_information.item_id = nil
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenが空では購入できないこと' do
      @purchase_record_shipping_information.token = nil
      @purchase_record_shipping_information.valid?
      expect(@purchase_record_shipping_information.errors.full_messages).to include("Token can't be blank")
    end

  end
end
