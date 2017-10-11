class CustomerAddress < ApplicationRecord
  belongs_to :customer 
  belongs_to :province
  belongs_to :district

  validates :customer_id, uniqueness: true
end
