class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :entity, null: false, foreign_key: true
      t.float :amount
      t.datetime :date
      t.string :category
      t.boolean :recurring
      t.string :schedule

      t.timestamps
    end
  end
end
