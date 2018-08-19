class CreateNutritionists < ActiveRecord::Migration[5.2]
  def change
    create_table :nutritionists do |t|
      t.string :name
      t.string :bio

      t.timestamps
    end
  end
end
