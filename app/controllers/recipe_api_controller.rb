class RecipeApiController < ApplicationController

  skip_forgery_protection

  @json = nil

  def show
  end

  def search
    app_id = ENV.fetch('EDAMAM_APPLICATION_ID')
    key = ENV.fetch('EDAMAM_APPLICATION_KEY')
    response = RestClient.get("https://api.edamam.com/api/recipes/v2?type=public&q=tomato%20&app_id=#{app_id}&app_key=#{key}&dishType=Soup")
    @json = JSON.parse response
    
    render :show
  end

  private

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
end
