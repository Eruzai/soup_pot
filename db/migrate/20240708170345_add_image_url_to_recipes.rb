class AddImageUrlToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :web_image, :string
  end
end
