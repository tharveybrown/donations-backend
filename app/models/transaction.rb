require 'plaid'
require 'date'
require_relative './plaid.rb'

class Transaction 
  include Plaid
  
  attr_reader :plaid_id, :name, :amount, :iso_currency_code, :category_id,
              :type, :date, :account_id, :recurring

  def initialize(transaction_data = {})
    @plaid_id = transaction_data['transaction_id']
    @name = transaction_data['name']
    @amount = transaction_data['amount'] <= 0 ? transaction_data['amount'].abs : -transaction_data['amount']
    @iso_currency_code = transaction_data['iso_currency_code']
    @category = transaction_data['category'][0]
    # @type = transaction_data['type']
    @date = Date.parse(transaction_data['date'])
    @account_id = transaction_data['account_id']
    @recurring = false
    @donation = false
  end


  def self.all(token, user)
    # token ||= token
    
    Plaid.fetch(token).map do |transaction|
      
      initialized_transaction = new(transaction)
      initialized_transaction.set_recurrency(token)
      if !Expense.where(plaid_id: initialized_transaction.plaid_id).exists?
        entity = Entity.find_or_create_by(name: transaction['merchant_name'])
        
        expense = Expense.create(initialized_transaction.instance_values.merge(user: user, entity: entity))
          
      end
      initialized_transaction
    end
    Expense.where.not(plaid_id: '')
  end

  def self.find(token, id)
    all(token).select { |transaction| transaction.id == id }.first
  end

  def self.find_by_ids(token, ids)
    all(token).select { |transaction| ids.include?(transaction.id) }
  end

  def set_recurrency(token)
    
    @recurring = is_recurrent?(token)
  end

  def is_recurrent?(token)
    transactions = Plaid.fetch_by_dates_month(token, date.prev_month)
    # commenting out due to rate limiting restrictions from plaid
    # transactions += Plaid.fetch_by_dates_month(token, date.prev_month.prev_month) 
    recurring = transactions.select do |transaction|
      transaction['name'] == name && transaction['account_id'] == account_id &&
        transaction['amount'] == amount
    end
    recurring.count >= 2
  end
end