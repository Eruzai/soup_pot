class SavedRecipesController < ApplicationController

  def show
    @recipe = Recipe.find params[:id]
    @ingredients = query_recipe_ingredients_to_string(@recipe)
  end

  def my_recipes
    @path = 'my_recipes'
    @user = User.find (current_user.id)
    @recipes = @user.recipes.all
    render '/saved_recipes/index'
  end

  def friends_recipes
    @user = User.find (current_user.id)
    @friends = @user.friends.where(pending: false).map(&:friend) + @user.inverse_friends.where(pending: false).map(&:user)
    @recipes = @friends.flat_map(&:recipes)
    render '/saved_recipes/index'
  end

  def new
  end

  def create
    @user = User.find (current_user.id)
    @recipe = @user.recipes.new(recipe_params)

    if @recipe.save
      recipe_ingredients.each do |item|
        @ingredient = @recipe.ingredients.new(item: item)
        @ingredient.save
      end
      redirect_to '/my_recipes', notice: 'Recipe information and ingredients saved!'
    else
      raise 'Recipe failed to save!'
    end
  end

  def edit
    @recipe = Recipe.find params[:id]
    @recipe.update(recipe_params)

    if @recipe.save
      @recipe.ingredients.destroy_all
      recipe_ingredients.each do |item|
        @ingredient = @recipe.ingredients.new(item: item)
        @ingredient.save
      end
      redirect_to '/my_recipes', notice: 'Recipe information and ingredients updated!'
    else
      raise 'Recipe failed to update!'
    end
  end

  def destroy
    @recipe = Recipe.find params[:id]
    @recipe.destroy

    redirect_to '/my_recipes'
  end

  private

  def query_recipe_ingredients_to_string(recipe)
    @ingredients = recipe.ingredients.all
    @list = []
    @ingredients.each do |item| 
      @list << item.item
    end
    @list = @list.join(',')
  end

  def recipe_ingredients
    params[:ingredients].split(',')
  end

  def recipe_params
    params.permit(
      :name,
      :image,
      :description,
      :cooking_time,
      :directions
    )
  end

end
