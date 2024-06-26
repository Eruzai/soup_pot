class RecipeApiController < ApplicationController

  skip_forgery_protection

  @json = nil

  def show
  end

  def search
    search_recipes
  end

  private

  def search_recipes
    response = RestClient.get('https://api.edamam.com/api/recipes/v2?type=public&q=potato%2C%20carrot%2C%20celery%2C%20leek&app_id=bc70c8f4&app_key=f005f5f0c7a7709124e657b4457c6926&dishType=Soup')
    @json = JSON.parse response
    
    render :show
  end

  def search_params
    # params.require(:review).permit(
    #   :product_id,
    #   :user_id,
    #   :description,
    #   :rating
    # )
  end
end
