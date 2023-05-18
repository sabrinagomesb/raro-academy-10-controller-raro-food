# Routes checklist

## Model Chef

- /chefs
  - [x] GET
- /chefs/:id
  - [x] GET
  - [x] POST
  - [x] PATCH
  - [x] DELETE
- /chefs/:chef_id/address
  - [x] GET
- /chefs/:chef_id/city
  - [x] GET
- /chefs/:chef_id/state
  - [x] GET
- /chefs/:chef_id/telephones
  - [x] GET
  - [x] POST
  - [x] PATCH
  - [x] DELETE
- /chefs/:chef_id/dishes
  - [x] GET
  - [x] POST
  - [x] PATCH
  - [x] DELETE

## Model Coupon

- /coupons
  - [x] GET
- /coupons/:id
  - [x] GET
  - [x] POST
  - [x] PATCH
  - [x] DELETE
- /coupons/:coupon_id/orders
  - [x] GET

## Model Customer

- /customers
  - [x] GET
- /customers/:id
  - [x] GET
  - [x] POST
  - [x] UPDATE
  - [x] DELETE
- /customers/:customer_id/orders
  - [x] GET
  - [x] POST
  - [x] PATCH
  - [x] DELETE
- /customers/:customer_id/addresses/:id
  - [x] GET
  - [x] POST
  - [x] PATCH
  - [x] DELETE
- /customers/:customer_id/telephones
  - [x] GET
  - [x] POST
  - [x] PATCH
  - [x] DELETE
- /customers/:customer_id/cards/:id
  - [x] GET
  - [x] POST
  - [x] UPDATE
  - [x] DELETE

## Model Dish

- /dishes
  - [x] GET
- /dishes/:id
  - [x] GET
  - [x] POST
  - [x] UPDATE
  - [x] DELETE
- /dishes/:dish_id/categories
  - [x] GET

## Model Order

- /orders
  - [x] GET
  - [x] POST
  - [x] UPDATE
  - [x] DELETE
- /orders/:id
  - [x] GET
- /orders/:order_id/order_items
  - [x] GET
- /orders/:order_id/order_items/:id
  - [x] GET
  - [x] POST
  - [x] UPDATE
  - [x] DELETE
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
  - [x] POST
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
  - [x] POST
  - [x] PATCH
  - [x] DELETE

## Model Address

- /addresses
  - [x] GET
- /addresses/:id
  - [x] GET
  - [x] POST
  - [x] PATCH
  - [x] DELETE
