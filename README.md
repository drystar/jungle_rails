# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by instructor lead examples.

# Functions

Jungle is a shopping website where a user, regardless if logged in or not, can add items to their cart and purchase the item using a stripe payments system

# Learning Outcomes

- Become familiar with Ruby and the Rails framework
- Learn how to navigate an existing code-base
- Use existing code style and approach to implement new features in unfamiliar territory
- Apply previous learning tactics to research and become familiar with a new paradigm, language and framework
- Implement feature and bug-fix request solution and automated testing

# Final Product

!["home_page"](https://github.com/drystar/jungle_rails/blob/master/docs/home.png?raw=true)

!["elect_category"](https://github.com/drystar/jungle_rails/blob/master/docs/category.png?raw=true)

!["my_cart"](https://github.com/drystar/jungle_rails/blob/master/docs/my_cart.png?raw=true)

!["admin_products"](https://github.com/drystar/jungle_rails/blob/master/docs/admin_products.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
- Capybara & Poltergeist
