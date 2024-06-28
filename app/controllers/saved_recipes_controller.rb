class SavedRecipesController < ApplicationController

  def show
  end

  def my_recipes
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

  def create
  end

  def edit
  end

  def destroy
    @recipe = Recipe.find params[:id]
    @recipe.destroy

    redirect_to '/my_recipes'
  end

end
