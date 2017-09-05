FactoryGirl.define do
  factory :product_tag do
    product {FactoryGirl.create :product}
    tag {FactoryGirl.create :tag, shop: product.shop}
  end
end
