Rails.application.routes.draw do
  root "home#index"
  get "orders/menu" => "orders/menu"
  post "orders/confirm" => "orders/confirm"
  resources :orders,only: :create
end
