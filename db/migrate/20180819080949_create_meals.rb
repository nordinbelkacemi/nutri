class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :recipe
      t.string :type
      t.integer :calories
      t.references :nutritionist, foreign_key: true
      t.references :meal_plan, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
