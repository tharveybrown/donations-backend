require 'date'

module Plaid
  
  module_function
  def default_client
    @default_client ||= Plaid::Client.new(env: :sandbox,
      client_id: ENV["PLAID_CLIENT_ID"],
      secret: ENV["PLAID_SECRET"],
      public_key: ENV["PLAID_PUBLIC_KEY"])
  end

  def self.generate_access_token(public_token)
    exchange_token_response = default_client.item.public_token.exchange(public_token)
    exchange_token_response['access_token']
  end

  # module Transactions
    
    MAX_NUMBER_DAYS = 30

    # module_function

    def fetch(access_token, start_date = Date.today, last_date = Date.today - MAX_NUMBER_DAYS)
      fetch_plaid(access_token, start_date, last_date)
    end


    def fetch_plaid(access_token, start_date, last_date)
      transaction_response = client.transactions.get(access_token, last_date, start_date)
      byebug
      institutions = client.institutions.get(count: 3, offset: 1)
      transactions = transaction_response.transactions

      while transactions.length < transaction_response['total_transactions']
        transaction_response = client.transactions.get(access_token,
                                                       last_date,
                                                       start_date,
                                                       offset: transactions.length)
        transactions += transaction_response.transactions
      end

      # CacheService::Plaid.set_transactions_chunk_cache(access_token, start_date, last_date, transactions)

      transactions
    end

    def fetch_by_dates_month(access_token, date)
      beginning_of_month = Date.new(date.year, date.month, 1)
      end_of_month = Date.new(date.year, date.month, -1)
      fetch(access_token, end_of_month, beginning_of_month)
    end

    def client
      @client ||= self.default_client
    end
  # end
end