FactoryGirl.define do
  factory :facebook_page do
    category_name {Faker::Book.genre}
    access_token {Faker::Crypto.md5}
    name {Faker::Commerce.material}
    id {Faker::Number.number 15}
  end
end
