# frozen_string_literal: true

Rails.application.routes.draw do
  # Model Chef:
  resources :chefs, params: :chef_id, only: %i[index show] do                       # /chefs
    get 'city', to: 'chefs#city'                                                    # /chefs/:chef_id/city
    get 'state', to: 'states#index'                                                 # /chefs/:chef_id/state
    resources :dishes, only: %i[index show]                                         # /chefs/:chef_id/dishes
    resources :telephones, only: %i[index show create update destroy]               # /chefs/:chef_id/telephones
    resources :addresses, path: 'address', only: %i[index]                          # /chefs/:chef_id/address
  end

  # Model Customers:
  resources :customers, params: :customer_id, only: %i[index show] do               # /customer
    resources :orders, only: %i[index show]                                         # /customer/:customer_id/dishes
    resources :telephones                                                           # /customer/:customer_id/telephones
    resources :addresses                                                            # /customer/:customer_id/addresses
    resources :cards, only: %i[index show create update destroy]                    # /customer/:customer_id/cards
  end

  # Model Orders:
  resources :orders, params: :order_id, only: %i[index show] do                     # /orders
    get 'city', to: 'orders#city'                                                   # /orders/:order_id/city
    resources :order_items, only: %i[index show]                                    # /orders/:order_id/order_items
    resources :payments, path: 'payment', only: %i[index]                           # /orders/:order_id/payments
    resources :dishes, only: %i[index show]                                         # /orders/:order_id/dishes
  end

  # Model Payments:
  resources :payments, params: :payment_id do                                        # /payments
    get 'customer', to: 'payments#customer'                                          # /payments/:payment_id/customer
  end

  # Model Dishes:
  resources :dishes, params: :dish_id, only: %i[index show] do                        # /dishes
    get 'categories', to: 'dishes#categories'                                         # /dishes/:dish_id/categories
  end

  # Model States:
  resources :states, params: :state_id, only: %i[index show] do                       # /states
    get 'cities', to: 'states#cities', as: 'state_cities'                             # /states/:state_id/cities
  end

  # Model Coupons:
  resources :coupons, params: :coupon_id, only: %i[index show] do                     # /coupons
    resources :orders, only: %i[index]                                                # /coupons/:coupon_id/orders
  end

  # Model Telephones:
  resources :telephones # /telephones

  # Model Address:
  resources :addresses                                                                # /addresses
end
