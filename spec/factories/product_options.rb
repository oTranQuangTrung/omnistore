FactoryGirl.define do
  factory :product_option do
    product {FactoryGirl.create :product}
    option {FactoryGirl.create :option, shop: product.shop}
    sequence(:value) {|n| "value_#{n}"}
  end
end
