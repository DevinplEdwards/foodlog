class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :meal_type
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fats

      t.timestamps
    end
  end
end
