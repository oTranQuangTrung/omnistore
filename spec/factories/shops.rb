FactoryGirl.define do
  factory :shop do
    sequence(:name) {|n| "shop_#{n}"}
  end
end
