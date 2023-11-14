class RemoveColumnItemNameFromInventories < ActiveRecord::Migration[7.1]
  def change
    remove_column :inventories, :item_name, :string
  end
end
