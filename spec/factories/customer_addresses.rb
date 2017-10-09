FactoryGirl.define do
  factory :customer_address do
    customer {FactoryGirl.create :customer}
    province {FactoryGirl.create :province}
    district {FactoryGirl.create :district, province_id: province.id} 
  end
end
