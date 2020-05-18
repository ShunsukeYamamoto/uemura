class OrdersController < ApplicationController

  def index
    @order = Order.all.where(done: false)
    # binding.pry
  end

  def done
    order = Order.find(params[:id])
    time = TimeManagement.find(order[:time_management_id])
    order.destroy
    time[:reserved] = false
    time.save
    binding.pry
    redirect_to orders_path
  end

  def menu
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.food_orders.each do |m|
      if m.count != 0
        @order[:total_price] += (m.food[:price] * m.count)
        m.food[:stock] -= m.count
        m.food.save
      else
        m.delete
      end
    end
    @order.save
    time = TimeManagement.find(@order[:time_management_id])
    time[:reserved] = true
    time.save
    redirect_to order_path(@order)
  end

  def show
    @order = Order.find(params[:id])
    @food_orders = @order.food_orders
    @time = TimeManagement.find(@order[:time_management_id])
    # binding.pry
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
    params.require(:order).permit(:name,:address,:tel,:total_price,:time_management_id,done: false,food_orders_attributes: [:food_id,:count,:taste])
  end

end
