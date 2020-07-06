class ExpenseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :amount, :date, :category, :recurring, :donation, :plaid_id, :account_id, :iso_currency_code
  belongs_to :entity

end
