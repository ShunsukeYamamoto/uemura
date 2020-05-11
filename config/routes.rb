Rails.application.routes.draw do
  root "home#index"
  get "orders/menu" => "orders/menu"
end
