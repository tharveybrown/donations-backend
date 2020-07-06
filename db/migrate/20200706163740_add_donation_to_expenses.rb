class AddDonationToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :donation, :boolean
  end
end
