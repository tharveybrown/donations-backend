class ExpensesController < ApplicationController
  
  def index
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

  def create
    
  end

end
