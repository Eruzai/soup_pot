class ReviewsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      if current_user.id == @recipe.user_id
        redirect_to "/my_recipe/#{@recipe.id}"
      else
         redirect_to "/my_recipe/friends_recipes/#{@recipe.id}"
      end
    else
      render 'saved_recipes/index'
    end
  end

  def edit
    @recipe = Recipe.find params[:recipe_id]
    @review = @recipe.reviews.find params[:id]
  end

  def update
    @recipe = Recipe.find params[:recipe_id]
    @review = Review.find params[:id]
    if @review.update(review_params)
      if current_user.id == @recipe.user_id
        redirect_to "/my_recipe/#{@recipe.id}"
      else
         redirect_to "/my_recipe/friends_recipes/#{@recipe.id}"
      end
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find params[:recipe_id]
    @review = @recipe.reviews.find params[:id]
    @review.destroy
    if current_user.id == @recipe.user_id
      redirect_to "/my_recipe/#{@recipe.id}"
    else
      redirect_to "/my_recipe/friends_recipes/#{@recipe.id}"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
