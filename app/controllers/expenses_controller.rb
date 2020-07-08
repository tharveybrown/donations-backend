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

    user = session_user
    entity = Entity.find_or_create_by(name: params[:name])
    expense = Expense.create(user: session_user, entity: entity)
    if expense.update(expense_params)
       render json: {expense: expense}
    else
        render json: {errors: user.errors.full_messages}, status: :not_acceptable
    end
  end

  private
    
  def expense_params
    params.require(:expense).permit( 
      :id,
      :user_id, 
      :entity_id,
      :amount, 
      :date, 
      :category, 
      :recurring, 
      :schedule, 
      :created_at, 
      :plaid_id, 
      :name, 
      :account_id, 
      :iso_currency_code, 
      :donation,
      entity_attributes: [:name, :website],
      user_attributes: [:first_name, :last_name, :email]
    )
  end
end
