FactoryGirl.define do
  factory :shop do
    name {Faker::Bank.name}
  end
end
