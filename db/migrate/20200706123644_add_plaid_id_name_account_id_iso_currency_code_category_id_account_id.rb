class AddPlaidIdNameAccountIdIsoCurrencyCodeCategoryIdAccountId < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :plaid_id, :string
    add_column :expenses, :name, :string
    add_column :expenses, :account_id, :integer
    add_column :expenses, :iso_currency_code, :string
    
  end
end
