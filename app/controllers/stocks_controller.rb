class StocksController < ApplicationController
  def index
    @foods = Food.all
  end

  def update
    @foods = food_params.keys.each do |food_id|
      food = Food.find(food_id.to_i)
      food[:stock] = food_params[food_id]["stock"].to_i
      food.save
    end
    redirect_to stocks_path
  end

  private

  def food_params
    params.permit(foods: :stock)[:foods]
  end
end
