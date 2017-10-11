FactoryGirl.define do
  factory :customer do
    name {Faker::Name.name}
    profile_picture_url "MyString"
    email {Faker::Internet.email}
    phone_number {Faker::PhoneNumber.phone_number} 
    address "MyString"
    facebook_id {Faker::Number.number(10)}
    shop_id {FactoryGirl.create(:shop).id}
  end
end
