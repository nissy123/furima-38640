FactoryBot.define do
  factory :purchase_record_form do
    user_id {1}
    product_id {1}
    postal_code {"123-1457"}
    prefecture_id {2}
    city { Faker::Address.city }
    block { Faker::Address.street_address }
    buildings_name { Faker::Address.street_address }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
