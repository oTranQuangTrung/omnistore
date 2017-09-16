FactoryGirl.define do
  factory :variant do
    product {FactoryGirl.create :product}
    sequence(:name) {|n| "variant_#{n}"}
    price {Faker::Commerce.price}
    sku {Faker::Commerce.promotion_code}
    barcode {Faker::Code.asin}
    quantity {Faker::Number.number 2}
  end
end
