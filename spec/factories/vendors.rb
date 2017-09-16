FactoryGirl.define do
  factory :vendor do
    shop {FactoryGirl.create :shop}
    sequence(:name) {|n| "vendor_#{n}"}
  end
end
