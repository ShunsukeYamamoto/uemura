Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "orders/menu" => "orders/menu"
  get "orders/food_data" => "orders/food_data"
  get "orders/order_data" => "orders/order_data"
  resources :orders,only: [:show,:index,:create] do
    member do
      delete :done
    end
  end
  get "stocks" => "stocks#index"
  put "stocks" => "stocks#update"
end
