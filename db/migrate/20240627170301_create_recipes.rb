class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :user_id
      t.string :name
      t.string :images
      t.string :description
      t.string :cooking_time
      t.string :source
      t.string :recipe_url

      t.timestamps
    end
  end
end
