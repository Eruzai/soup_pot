class SavedRecipesController < ApplicationController

  def my_recipes
    @user = User.find (current_user.id)
    @recipes = @user.recipes.all
    render '/saved_recipes/show'
  end

  # def friends_recipes
  #   @user = User.find (current_user.id)
  #   @friends = @user.friends.all
  #   @recipes = @friends.each do |friend| friend.recipes.all
  #   render '/saved_recipes/show'
  # end

end
