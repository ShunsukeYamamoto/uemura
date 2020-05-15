class Food < ApplicationRecord
  validates :name, presence: true
  validates :price,numericality: {greater_than_or_equal_to: 0}
  validates :stock,numericality: {greater_than_or_equal_to: 0}

  enum genre: { 
    "豚もつ串": 0,
    "とり・他串": 1,
    "野菜系串": 2,
    "串揚げ": 3,
    "揚げ物": 4,
    "お刺身": 5,
    "一品料理": 6,
  }

  has_many :food_orders
  has_many :orders,through: :food_orders

end
