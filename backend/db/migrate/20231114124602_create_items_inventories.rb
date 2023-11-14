class CreateItemsInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :items_inventories do |t|
      t.integer :quantity
      t.references :item, null: false, foreign_key: true
      t.references :inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
