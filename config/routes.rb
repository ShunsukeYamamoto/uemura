Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "pages/menu" => "pages/menu"
  get "pages/pride" => "pages/pride"
  get "pages/contact" => "pages/contact"
  get "pages/notice/:id" => "pages#notice"
  get "pages/gallery" => "pages/gallery"
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
  resources :notices,except: :show
end
