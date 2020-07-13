# donations-backend

Ruby on Rails backend for a [personal finance application](https://github.com/tharveybrown/howamispendingmoney) to track expenses and donations.

This app integrates with [Plaid](https://plaid.com/) to allow users to link their bank account(s). It uses the Figaro gem to manage secrets. You will need to register an application with Plaid and include the following in `config/application.yml`:

```yml
PLAID_CLIENT_ID: <your_client_id>
PLAID_SECRET: <your_secret_key>
PLAID_PUBLIC_KEY: <your_public_key>
PLAID_ENV: <your_development_mode> #options include sandbox, development, and production
PLAID_PRODUCTS: transactions
PLAID_COUNTRY_CODES: US
```

To get the database set up:

- `rake db:setup`

- `rake db:migrate`

- `rake db:seed`

The seed will scrape organizations listed from [Impact Matters](https://www.impactmatters.org/), a guide to finding high-impact non-profits.

Once complete, run `rails s` to start the app and run the frontend app in tandem. This app runs on port 3001; the frontend runs on 3001.
