# frozen_string_literal: true

Rails.application.routes.draw do
  # Model Chef:
  get "/chefs", to: "chefs#index"
  get "/chefs/:id", to: "chefs#show"
  get "/chefs/:chef_id/address", to: "chefs#show_address"
  get "/chefs/:chef_id/city", to: "chefs#show_city"
  get "/chefs/:chef_id/state", to: "chefs#show_state"
  get "/chefs/:chef_id/telephones", to: "chefs#show_telephones"
  get "/chefs/:chef_id/dishes", to: "chefs#show_dishes"

  #   Model Coupon:
  get "/coupons", to: "coupons#index"
  get "/coupons/:id", to: "coupons#show"
  get "/coupons/:coupon_id/orders", to: "coupons#show_orders"

  #   Model Customer:
  resources :customers, :orders
  resources :customers, only: %i[index show] do
    resources :orders
  end
  get "/customers/:customer_id/addresses", to: "customers#show_addresses"
  get "/customers/:customer_id/telephones", to: "customers#show_telephones"
  get "/customers/:customer_id/cards", to: "customers#show_cards"
  # todos os customers tem apenas um endereço

  #   Model Dish:
  get "/dishes", to: "dishes#index"
  get "/dishes/:id", to: "dishes#show"
  get "/dishes/:dish_id/categories", to: "dishes#show_categories"
  # /dishes
  # /dishes/:id
  # /dishes/:dish_id/categories

  #   Model Order:
  get "/orders", to: "orders#index"
  get "/orders/:id", to: "orders#show"
  # /orders
  # /orders/:id
  # /orders/:order_id/items
  # /orders/:order_id/items/:item_id
  # /orders/:order_id/dishes
  # /orders/:order_id/dishes/:dish_id
  # /orders/:order_id/city
  # /orders/:order_id/payment
end
