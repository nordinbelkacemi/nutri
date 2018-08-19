class CreateCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :certificates do |t|
      t.string :name
      t.string :institution
      t.references :nutritionist, foreign_key: true

      t.timestamps
    end
  end
end
