class Customer < ApplicationRecord
  has_one :customer_address, dependent: :destroy
end
