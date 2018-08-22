class AddPhotoToNutritionists < ActiveRecord::Migration[5.2]
  def change
    add_column :nutritionists, :photo, :string
  end
end
