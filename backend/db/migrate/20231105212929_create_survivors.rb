class CreateSurvivors < ActiveRecord::Migration[7.1]
  def change
    create_table :survivors do |t|
      t.string :name, null:false
      t.integer :age, null:false
      t.string :gender
      t.float :latitude, null:false
      t.float :longitude, null:false
      t.boolean :isAlive, null:false

      t.timestamps
    end
  end
end
