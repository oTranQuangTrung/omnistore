FactoryGirl.define do
  factory :collection do
    shop {FactoryGirl.create :shop}
    sequence(:name) {|n| "collection_#{n}"}
    description {Faker::Lorem.paragraph(2)}
    public {Faker::Boolean.boolean}
  end
end
