class Province < ApplicationRecord
  has_many :customers
  has_many :districts, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
