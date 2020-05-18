class StocksController < ApplicationController
  def index
    @foods = Food.all
  end

  def update
    
  end

  private

  def food_params
    
  end
end
