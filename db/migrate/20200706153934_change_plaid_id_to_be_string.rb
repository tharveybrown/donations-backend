class ChangePlaidIdToBeString < ActiveRecord::Migration[6.0]
  def change
    change_column :expenses, :plaid_id, :string
  end
end
