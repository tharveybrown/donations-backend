# require_relative '../models/plaid.rb'
require_relative '../models/transaction.rb'

class PlaidController < ApplicationController
  before_action :require_login
  include Plaid
  # include Transaction

  def authlogin 
    
    token = params[:token]
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
      
    @bearer_token = params[:plaid][:access_token]
    @transactions = Transaction.all(@bearer_token, session_user)
    expenses = session_user.expenses
    
    if expenses
      options = {
          include: [:entity]
        }
      render json: expenses.to_json(:include => {
        :entity => {:only => [:id, :name, :webiste]},
      }, :except => [:updated_at])
    else 
      render json: {errors: expenses.errors.full_messages}, status: :not_acceptable
    end
  end

  private


end