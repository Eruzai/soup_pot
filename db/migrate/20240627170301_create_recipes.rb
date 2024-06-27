class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :image
      t.text :description
      t.string :cooking_time
      t.string :source
      t.string :recipe_url

      t.timestamps
    end
  end
end
