class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :website

      t.timestamps
    end
  end
end
