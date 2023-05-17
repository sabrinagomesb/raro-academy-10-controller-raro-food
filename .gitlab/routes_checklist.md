# Routes checklist

## Model Chef

- /chefs
  - [x] GET
- /chefs/:id
  - [x] GET
- /chefs/:chef_id/address
  - [x] GET
- /chefs/:chef_id/city
  - [x] GET
- /chefs/:chef_id/state
  - [x] GET
- /chefs/:chef_id/telephones
  - [x] GET
- /chefs/:chef_id/dishes
  - [x] GET

## Model Coupon

- /coupons
  - [x] GET
- /coupons/:id
  - [x] GET
- /coupons/:coupon_id/orders
  - [x] GET

## Model Customer

- /customers
  - [x] GET
- /customers/:id
  - [x] GET
- /customers/:customer_id/orders
  - [x] GET
- /customers/:customer_id/addresses/:id
  - [x] GET
- /customers/:customer_id/telephones
  - [x] GET
- /customers/:customer_id/cards/:id
  - [x] GET
  - [ ] UPDATE
  - [ ] DELETE

## Model Dish

- /dishes
  - [x] GET
- /dishes/:id
  - [x] GET
  - [ ] UPDATE
  - [ ] DELETE
- /dishes/:dish_id/categories
  - [x] GET

## Model Order

- /orders
  - [x] GET
- /orders/:id
  - [x] GET
- /orders/:order_id/order_items
  - [x] GET
  - [ ] ???
- /orders/:order_id/order_items/:id
  - [x] GET
  - [ ] ???
- /orders/:order_id/dishes
  - [x] GET
- /orders/:order_id/dishes/:id
  - [x] GET
- /orders/:order_id/city
  - [x] GET
- /orders/:order_id/payment
  - [x] GET

## Model Payment

- /payments
  - [x] GET
  - [x] PATCH
  - [x] DELETE
- /payments/:id
  - [x] GET
- /payments/:payment_id/customer
  - [x] GET

## Model State

- /states
  - [x] GET
- /states/:id
  - [x] GET
- /states/:state_id/cities
  - [x] GET

## EXTRAS

## Model Telephone

- /telephones
  - [x] GET
- /telephones/:id
  - [x] GET
  - [ ] PATCH
  - [ ] DELETE

## Model Address

- /addresses
  - [x] GET
- /addresses/:id
  - [x] GET
  - [ ] PATCH
  - [ ] DELETE
