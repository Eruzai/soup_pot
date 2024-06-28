class SavedRecipesController < ApplicationController

  def show
  end

  def my_recipes
    @path = 'my_recipes'
    @user = User.find (current_user.id)
    @recipes = @user.recipes.all
    render '/saved_recipes/index'
  end

  # def friends_recipes
  #   @user = User.find (current_user.id)
  #   @friends = @user.friends.all
  #   @recipes = @friends.each do |friend| friend.recipes.all
  #   render '/saved_recipes/index'
  # end

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
  end

  def destroy
    @recipe = Recipe.find params[:id]
    @recipe.destroy

    redirect_to '/my_recipes'
  end

  private

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
