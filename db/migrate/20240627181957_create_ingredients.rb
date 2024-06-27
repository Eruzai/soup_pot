class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.references :recipe, index: true, foreign_key: true
      t.string :item

      t.timestamps
    end
  end
end
