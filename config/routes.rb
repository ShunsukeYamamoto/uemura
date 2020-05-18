Rails.application.routes.draw do
  root "home#index"
  get "orders/menu" => "orders/menu"
  resources :orders,only: [:show,:index] do
    member do
      delete :done
    end
  end
  get "stocks" => "stocks#index"
  post "stocks" => "stocks#update"
  resources :orders,only: :create
end
