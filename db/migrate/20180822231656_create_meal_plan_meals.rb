class CreateMealPlanMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_plan_meals do |t|
      t.references :meal, foreign_key: true
      t.references :meal_plan, foreign_key: true

      t.timestamps
    end

    remove_column :meals, :meal_plan_id
  end
end
