# frozen_string_literal: true

Rails.application.routes.draw do
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
end
