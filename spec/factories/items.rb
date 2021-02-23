FactoryBot.define do
  factory :item do
    item_name           {"商品"}
    iteme_text           {"素晴らしい商品です。"}
    item_category_id    {2}
    item_status_id      {2}
    item_price          {3000}
    shipping_charges_id {2}
    shipping_area_id    {2}
    day_to_ship_id      {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
