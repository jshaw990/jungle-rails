# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots

### Sold Out Badge

![SoldOutBadge](https://github.com/jshaw990/jungle-rails/blob/feature/sold-out-badge/screenshots/SoldOutBadge.png?raw=true)

----------

### Admin New Category Bar
![NewCatBar](https://github.com/jshaw990/jungle-rails/blob/feature/admin-categories/screenshots/AdminNewCategoryBox.png?raw=true)

----------

### Admin New Category Added
![NewCatIn](https://github.com/jshaw990/jungle-rails/blob/feature/admin-categories/screenshots/AdminNewCategoryIn.png?raw=true)

----------

### User Signup Form
![SignUp](https://github.com/jshaw990/jungle-rails/blob/feature/users/screenshots/SignUp.png?raw=true)

----------

### User Sign In Form
![SignIn](https://github.com/jshaw990/jungle-rails/blob/feature/users/screenshots/Login.png?raw=true)

----------

### User Signed In View
![UserIn](https://github.com/jshaw990/jungle-rails/blob/feature/users/screenshots/SignedIn.png?raw=true)

----------

### Order Details
![OrderDetails](https://github.com/jshaw990/jungle-rails/blob/feature/order/screenshots/OrderDetails.png?raw=true)

----------

### Order Receipt Email
![OrderEmail](https://github.com/jshaw990/jungle-rails/blob/feature/receipt/screenshots/OrderEmail.png?raw=true)

----------

### Admin Log In
![AdminLogin](https://github.com/jshaw990/jungle-rails/blob/feature/admin-auth/screenshots/AdminLogIn.png?raw=true)

----------

### Empty Cart
![EmptyCart](https://github.com/jshaw990/jungle-rails/blob/feature/empty-cart/screenshots/EmptyCart.png?raw=true)

## Bug/To Do List:
* Order is showing Hardcoded Email rather than User Email
* Order Styling 
* Email Shows Inventory Quantity not Order Quantity
* Admin Session is persistent and will not clear unless browser is completely closed