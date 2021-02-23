require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '保存できる場合' do
    it "全ての項目が存在すれば出品できる" do
      expect(@item).to be_valid
    end
  end


  context '保存できない場合' do
    it "商品名が空では出品できないこと" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it "商品名が40文字より多い場合は出品できないこと" do
      @item.item_name = "a" * 51
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
    end

    it "商品の説明が空では出品できないこと" do
      @item.iteme_text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Iteme text can't be blank")
    end
    it "商品の説明が1000文字より多い場合は出品できないこと" do
      @item.iteme_text = "a" * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Iteme text is too long (maximum is 1000 characters)")
    end

    it "出品画像が空では出品できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "カテゴリーが空では出品できないこと" do
      @item.item_category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category can't be blank", "Item category can't be blank", "Item category is not a number")
    end
    it "カテゴリーの選択が「---」では出品できないこと" do
      @item.item_category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category must be other than 1")
    end

    it "商品の状態が空では出品できないこと" do
      @item.item_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status can't be blank", "Item status can't be blank", "Item status is not a number")
    end
    it "商品の状態の選択が「---」では出品できないこと" do
      @item.item_status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status must be other than 1")
    end

    it "配送料の負担が空では出品できないこと" do
      @item.shipping_charges_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges can't be blank", "Shipping charges can't be blank", "Shipping charges is not a number")
    end
    it "配送料の負担の選択が「---」では出品できないこと" do
      @item.shipping_charges_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
    end

    it "配送元の地域がからでは出品できないこと" do
      @item.shipping_area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank", "Shipping area can't be blank", "Shipping area is not a number")
    end
    it "配送元の地域の選択が「---」では出品できないこと" do
      @item.shipping_area_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end

    it "発送までの日時が空では投出品できないこと" do
      @item.day_to_ship_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship can't be blank", "Day to ship can't be blank", "Day to ship is not a number")
    end
    it "発送までの日時の選択が「---」では出品できないこと" do
      @item.day_to_ship_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship must be other than 1")
    end

    it "価格が空では出品できないこと" do
      @item.item_price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price can't be blank")
    end

    it "価格が整数でなければ出品できないこと" do
      @item.item_price = "300.5"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be an integer")
    end

    it "価格が300円未満では出品できないこと" do
      @item.item_price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
    end

    it "価格が9999999円より大きい場合は出品できないこと" do
      @item.item_price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
    end

    it "価格が半角数字のみでしか出品できないこと" do
      @item.item_price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is not a number")
    end

    it "userが紐付いていないと保存できないこと" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
   
  end
end
