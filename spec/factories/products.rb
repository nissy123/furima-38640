FactoryBot.define do
  factory :product do
    product_name             {"hoge"}
    description {Faker::Lorem.sentence}
    category_id {2}
    state_id {2}
    delivery_charge_burden_id {2}
    regional_original_delivery_id {2}
    days_up_to_delivery_id {2}
    price {"9999"}
    
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
