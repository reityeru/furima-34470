FactoryBot.define do
  factory :purchase_record_shipping_information do
    postal_code      { '123-4567' }
    shipping_area_id { 2 }
    municipality     { '横浜市緑区' }
    address          { '青山1-1-1' }
    building_name    { '柳ビル103' }
    phone_number     { '09011111111' }

    number           { 4242424242424242 }
    exp_month        { 3 }
    exp_year         { 40 }
    cvc              { 123 }
  end
end
