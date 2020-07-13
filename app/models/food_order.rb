class FoodOrder < ApplicationRecord
  

  enum taste:{
    "塩": "0",
    "タレ": "1",
  }

  belongs_to :food
  belongs_to :order
  
end
