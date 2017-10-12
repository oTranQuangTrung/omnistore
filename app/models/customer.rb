class Customer < ApplicationRecord
  has_one :customer_address, dependent: :destroy
  accepts_nested_attributes_for :customer_address
end
