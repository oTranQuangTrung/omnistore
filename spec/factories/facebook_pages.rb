FactoryGirl.define do
  factory :facebook_page do
    category {Faker::Book.genre}
    access_token {Faker::Crypto.md5}
    name {Faker::Commerce.material}
    facebook_id {Faker::Number.number 15}
    user {FactoryGirl.create :user}
  end
end
