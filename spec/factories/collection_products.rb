FactoryGirl.define do
  factory :collection_product do
    collection {FactoryGirl.create :collection}
    product {FactoryGirl.create :product, shop: collection.shop}
  end
end
