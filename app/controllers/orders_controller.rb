class OrdersController < ApplicationController
  def menu
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.food_orders.each do |m|
      if m.count != 0
        @order[:total_price] += (m.food[:price] * m.count)
      else
        m.delete
      end
    end
    @order.save
  end

  def data
    food = Food.find(params[:id])
    @id = food.id
    @name = food.name
    @count = params[:count].to_i
    @price = food.price * @count
    @stock = food.stock
  end



  private

  def order_params
    params.require(:order).permit(:name,:address,:tel,:total_price,done: false,food_orders_attributes: [:food_id,:count,:taste])
  end

end
