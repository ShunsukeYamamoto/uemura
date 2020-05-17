Rails.application.routes.draw do
  root "home#index"
  get "orders/menu" => "orders/menu"
  get "orders/data" => "orders/data"
  resources :orders,only: :show
  post "orders/confirm" => "orders/confirm"
  resources :orders,only: :create
end
