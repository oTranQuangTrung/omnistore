FactoryGirl.define do
  factory :product do
    sequence(:name) {|n| "product_#{n}"}
    shop {FactoryGirl.create :shop}
    description {Faker::Lorem.paragraph(2)}
    category {FactoryGirl.create :category, shop: shop}
    vendor {FactoryGirl.create :vendor, shop: shop}
    price {Faker::Commerce.price}
    sku {Faker::Commerce.promotion_code}
    barcode {Faker::Code.asin}
  end
end
