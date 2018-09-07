class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.references :course

      t.timestamps
    end
  end
end
