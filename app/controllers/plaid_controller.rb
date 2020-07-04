# require_relative '../models/plaid.rb'
require_relative '../models/transaction.rb'

class PlaidController < ApplicationController
  include Plaid
  # include Transaction

  def authlogin 
    token = params[:token]
    # byebug
    @access_token = Plaid.generate_access_token(token)
    
    if @access_token
      render json: {
        access_token: @access_token
      }
    else
      render json: {
        status: 500,
        errors: ['no access token found']
      }
    end
  end

  def transactions
    @bearer_token = bearer_token
    @transactions = Transaction.all(@bearer_token)
    if @transactions
      render json: {
        transactions: @transactions
      }
    else 
      render json: {
        status: 500,
        errors: ['no transactions found']
      }
    end
  end

  private
  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization']
    header.gsub(pattern, '') if header && header.match(pattern)
  end

end