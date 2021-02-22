class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :iteme_text, length: { maximum: 1000 }
    validates :item_price
    validates :item_category_id
    validates :item_status_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :day_to_ship_id

    with_options numericality: { other_than: 1 }  do
      validates :item_category_id
      validates :item_status_id
      validates :shipping_charges_id
      validates :shipping_area_id
      validates :day_to_ship_id
    end

  end

  has_one_attached :image

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :day_to_ship

end
