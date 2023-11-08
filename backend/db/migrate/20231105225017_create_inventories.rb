class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :description
      t.integer :quantity
      t.integer :value
      t.references :survivor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
