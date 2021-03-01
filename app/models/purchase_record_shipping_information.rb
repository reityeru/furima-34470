class PurchaseRecordShippingInformation
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number,
                :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

    ShippingInformation.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality,
                               address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
