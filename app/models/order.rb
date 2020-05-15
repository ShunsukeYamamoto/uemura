class Order < ApplicationRecord
  validates :name, presence: true
  validates :total_price, presence: true

  has_many :food_orders
  has_many :foods,through: :food_orders

  accepts_nested_attributes_for :food_orders, allow_destroy: true

end
