class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :dose
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
