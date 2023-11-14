class RenameValueAtoValue < ActiveRecord::Migration[7.1]
  def change
    rename_column :items, :"valueÃ", "value"
  end
end
