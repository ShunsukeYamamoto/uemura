class OrdersController < ApplicationController

  before_action :authenticate,except: [:show,:menu,:food_data,:order_data]

  def index
    @order = Order.all.where(done: false)
  end

  def done
    order = Order.find(params[:id])
    time = TimeManagement.find(order[:time_management_id])
    order.destroy
    time[:reserved] = false
    time.save
    redirect_to orders_path
  end

  def menu
    @order = Order.new
  end

  def create
    binding.pry
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
  end

  def food_data
    food = Food.find(params[:id])
    @id = food.id
    @name = food.name
    @count = params[:count].to_i
    @price = food.price * @count
    @stock = food.stock
  end

  def order_data
    @order = Order.last
  end

  private

  def order_params
    params.require(:order).permit(:name,:address,:tel,:total_price,:time_management_id,done: false,food_orders_attributes: [:food_id,:count,:taste])
  end

  def authenticate
    unless user_signed_in?
      redirect_to orders_menu_path
    end
  end

end
