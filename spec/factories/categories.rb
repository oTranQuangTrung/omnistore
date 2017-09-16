FactoryGirl.define do
  factory :category do
    shop {FactoryGirl.create :shop}
    sequence(:name) {|n| "category_#{n}"}
  end
end
