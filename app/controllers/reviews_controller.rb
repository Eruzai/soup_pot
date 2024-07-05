class ReviewsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to "/my_recipes", notice: 'Review was successfully created.'
    else
      render 'saved_recipes/show'
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
      redirect_to  "/my_recipes"
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find params[:recipe_id]
    @review = @recipe.reviews.find params[:id]
    @review.destroy
    redirect_to "/my_recipes", notice: 'Review deleted!'
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
