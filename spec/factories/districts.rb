FactoryGirl.define do
  factory :district do
    name {Faker::Address.city}
    province_id 1
  end
end
