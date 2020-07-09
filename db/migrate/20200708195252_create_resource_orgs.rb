class CreateResourceOrgs < ActiveRecord::Migration[6.0]
  def change
    create_table :resource_orgs do |t|
      t.string :name
      t.string :description
      t.string :website
      t.string :image
      t.string :category
      t.string :donate
      t.string :location
      t.string :scope

      t.timestamps
    end
  end
end
