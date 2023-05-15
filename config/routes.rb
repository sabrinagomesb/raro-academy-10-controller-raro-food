# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/chefs", to: "chefs#index"

  get "/chefs/:id", to: "chefs#show"

  get "/chefs/:chef_id/address", to: "chefs#show_address"
  get "/chefs/:chef_id/city", to: "chefs#show_city"
  get "/chefs/:chef_id/state", to: "chefs#show_state"
  get "/chefs/:chef_id/telephones", to: "chefs#show_telephones"
  get "/chefs/:chef_id/dishes", to: "chefs#show_dishes"
  # patch "/chefs/:id/", to: "chefs#update"
end
