FactoryGirl.define do
  factory :option do
    shop {FactoryGirl.create :shop}
    sequence(:name) {|n| "option_#{n}"}
  end
end
