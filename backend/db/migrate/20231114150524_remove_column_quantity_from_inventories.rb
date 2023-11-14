class RemoveColumnQuantityFromInventories < ActiveRecord::Migration[7.1]
  def change
    remove_column :inventories, :quantity, :integer
  end
end
