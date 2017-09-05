FactoryGirl.define do
  factory :tag do
    shop {FactoryGirl.create :shop}
    sequence(:name) {|n| "tag_#{n}"}
  end
end
