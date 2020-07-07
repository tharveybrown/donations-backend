class ExpensesController < ApplicationController
  
  def index
    expenses = session_user.expenses
    if expenses
      options = {
        include: [:entity]
      }
      render json: expenses.to_json(:include => {
        :entity => {:only => [:name, :webiste]},
      }, :except => [:updated_at])
    else
      render json: {errors: expenses.errors.full_messages}, status: :not_acceptable
    end
    
  end
  def create
    expense = Expense.create(expense_params) 
    if expense
       render json: {expense: expense}
    else
        render json: {errors: user.errors.full_messages}, status: :not_acceptable
    end
  end

  private
    
    def expense_params
      params.require(:expense).permit(:name, :amount, :date, :category, :recurring, :schedule, :iso_currency, :donation)
    end
end
