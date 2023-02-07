class ReviewsController < ApplicationController
  before_action :review_params, only: [:create]

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      render "pages/home"
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :email, :first_name, :last_name)
  end
end
