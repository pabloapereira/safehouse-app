class RemoveColumnlongitudeFromSurvivor < ActiveRecord::Migration[7.1]
  def change
    remove_column :survivors, :longitude, :float
  end
end
