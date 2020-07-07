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
    
    user = session_user
    entity = Entity.find_or_create_by(name: params[:entity_name])
    expense = Expense.create(user: session_user, entity: entity)
    if expense.update(expense_params)
       render json: {expense: expense}
    else
        render json: {errors: user.errors.full_messages}, status: :not_acceptable
    end
  end

  def update
    expense = Expense.find(params[:id])
    entity = Entity.find(params[:entity][:id])
    entity.update(name: params[:entity][:name], website: params[:entity][:website])
    if expense.update(expense_params)
      options = {
        include: [:entity]
      }
      render json: expense.to_json(:include => {
        :entity => {:only => [:id, :name, :webiste]},
      }, :except => [:updated_at])
    else 
      render json: {errors: expense.errors.full_messages}, status: :not_acceptable
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
