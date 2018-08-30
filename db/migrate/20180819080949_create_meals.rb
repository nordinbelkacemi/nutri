class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.text :recipe
      t.string :type
      t.integer :calories
      t.references :nutritionist, foreign_key: true
      t.references :meal_plan, foreign_key: true
      t.string :photo
      t.string :healthLabels
      t.string :carbs
      t.string :fat
      t.string :protein
      t.integer :yield
      t.integer :prep_time

      t.timestamps
    end
  end
end
