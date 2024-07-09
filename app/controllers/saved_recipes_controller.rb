class SavedRecipesController < ApplicationController

  def index
    @path = 'my_recipes'
    if params[:id]
      @recipe = Recipe.find params[:id]
      @ingredients = query_recipe_ingredients_to_string(@recipe)
      @review = @recipe.reviews.build
      @reviews = @recipe.reviews
      @avg_rating = @recipe.reviews.average(:rating)
    end
    @user = User.find (current_user.id)
    @recipes = @user.recipes.all
  end

  def friends_recipes
    @user = User.find (current_user.id)
    if params[:id]
      @recipe = Recipe.find params[:id]
      @ingredients = query_recipe_ingredients_to_string(@recipe)
      @review = @recipe.reviews.build
      @reviews = @recipe.reviews
      @avg_rating = @recipe.reviews.average(:rating)
    end
    @friends = @user.friends.where(pending: false).map(&:friend) + @user.inverse_friends.where(pending: false).map(&:user)
    @recipes = @friends.flat_map(&:recipes)
    render :index
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
      redirect_to my_recipes_path
    else
      raise 'Recipe failed to save!'
    end
  end

  def edit
    @recipe = Recipe.find params[:id]
    @ingredients = query_recipe_ingredients_to_string(@recipe)
  end

  def update
    @recipe = Recipe.find params[:id]

    if @recipe.update(recipe_params)
      @recipe.ingredients.destroy_all
      recipe_ingredients.each do |item|
        @ingredient = @recipe.ingredients.new(item: item)
        @ingredient.save
      end
      redirect_to '/my_recipes'
    else
      render :edit
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
