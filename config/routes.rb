# frozen_string_literal: true

Rails.application.routes.draw do
  # Model Chef:
  resources :chefs, params: :chef_id, only: %i[index show] do           # /chefs
    get 'city', to: 'chefs#city'                                        # /chefs/:chef_id/city
    get 'state', to: 'states#index'                                     # /chefs/:chef_id/state
    resources :dishes, only: %i[index show]                             # /chefs/:chef_id/dishes
    resources :telephones, only: %i[index show]                         # /chefs/:chef_id/telephones
    resources :addresses, path: 'address', only: %i[index show]         # /chefs/:chef_id/address
  end

  # Model Customers:
  resources :customers, params: :customer_id, only: %i[index show] do    # /customer
    resources :orders, only: %i[index show]                              # /customer/:customer_id/dishes
    resources :telephones, only: %i[index show]                          # /customer/:customer_id/telephones
    resources :addresses, only: %i[index show]                           # /customer/:customer_id/addresses
    resources :cards, only: %i[index show]                               # /customer/:customer_id/cards
  end

  # Model Orders:
  resources :orders, params: :order_id, only: %i[index show] # /orders

  # Model Dishes:
  resources :dishes, params: :dish_id, only: %i[index show] do          # /dishes
    get 'categories', to: 'dishes#categories'                           # /dishes/:dish_id/categories
  end
  # Model States:
  resources :states, params: :state_id, only: %i[index show] do
    get 'cities', to: 'states#cities', as: 'state_cities' # /states/:state_id/cities
  end

  # Model Coupons:
  resources :coupons, params: :coupon_id, only: %i[index show] do
    resources :orders, only: %i[index] # /coupons/:coupon_id/orders
  end

  # Model Telephones:
  resources :telephones, only: %i[index show] # /telephones

  # Model Address:
  resources :addresses, only: %i[index show] # /telephones

  # resources :chefs, params: :chef_id, only: %i[index show] do
  #   member do
  #     resource :dishes, only: %i[index show create update destroy]
  #   end
  # end

  # # Model Chef:
  # get "/chefs", to: "chefs#index"
  # get "/chefs/:id", to: "chefs#show"
  # get "/chefs/:chef_id/address", to: "chefs#show_address"
  # get "/chefs/:chef_id/city", to: "chefs#show_city"
  # get "/chefs/:chef_id/state", to: "chefs#show_state"
  # get "/chefs/:chef_id/telephones", to: "chefs#show_telephones"
  # get "/chefs/:chef_id/dishes", to: "chefs#show_dishes"

  # #   Model Coupon:
  # get "/coupons", to: "coupons#index"
  # get "/coupons/:id", to: "coupons#show"
  # get "/coupons/:coupon_id/orders", to: "coupons#show_orders"

  # #   Model Customer:
  # resources :customers, :orders
  # resources :customers, only: %i[index show] do
  #   resources :orders
  # end

  # get "/customers/:customer_id/addresses", to: "customers#show_addresses"
  # get "/customers/:customer_id/telephones", to: "customers#show_telephones"
  # get "/customers/:customer_id/cards", to: "customers#show_cards"
  # # todos os customers tem apenas um endereço

  # #   Model Dish:
  # get "/dishes", to: "dishes#index"
  # get "/dishes/:id", to: "dishes#show"
  # get "/dishes/:dish_id/categories", to: "dishes#show_categories"
  # # /dishes
  # # /dishes/:id
  # # /dishes/:dish_id/categories

  # #   Model Order:
  # get "/orders", to: "orders#index"
  # get "/orders/:id", to: "orders#show"
  # /orders
  # /orders/:id
  # /orders/:order_id/items
  # /orders/:order_id/items/:item_id
  # /orders/:order_id/dishes
  # /orders/:order_id/dishes/:dish_id
  # /orders/:order_id/city
  # /orders/:order_id/payment
end
