class RecipeApiController < ApplicationController

  skip_forgery_protection

  @json = nil

  def show
    @user = User.find(current_user.id)
    @items = @user.items.all
  end

  def create
    @user = User.find params[:id]
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

  def search
    app_id = ENV.fetch('EDAMAM_APPLICATION_ID')
    key = ENV.fetch('EDAMAM_APPLICATION_KEY')
    response = RestClient.get("https://api.edamam.com/api/recipes/v2?type=public&q=#{ingredients_query}%20&app_id=#{app_id}&app_key=#{key}&dishType=Soup")
    @json = JSON.parse response

    render :show
  end

  private

  def ingredients_query
    item = search_params
    query = "#{item[:ingredient_1]} #{item[:ingredient_2]} #{item[:ingredient_3]} #{item[:ingredient_4]} #{item[:ingredient_5]} #{item[:ingredient_6]} #{item[:ingredient_7]} #{item[:ingredient_8]} #{item[:ingredient_9]} #{item[:ingredient_10]},"
    query.strip
  end

  def search_params
    params.permit(
      :ingredient_1,
      :ingredient_2,
      :ingredient_3,
      :ingredient_4,
      :ingredient_5,
      :ingredient_6,
      :ingredient_7,
      :ingredient_8,
      :ingredient_9,
      :ingredient_10,
    )
  end

  def recipe_ingredients
    ingredients = params[:ingredients].keys.join("").split('", "')
  end

  def recipe_params
    params.permit(
      :name,
      :description,
      :source,
      :recipe_url,
      :image,
      :cooking_time,
    )
    return {
      name: params[:name].keys.join(""),
      description: params[:description].keys.join(""),
      source: params[:source].keys.join(""),
      recipe_url: params[:recipe_url].keys.join(""),
      image: params[:image].keys.join(""),
      cooking_time: params[:cooking_time].keys.join(""),
      directions: 'Follow recipe link for cooking instructions.'
    }
  end

end
