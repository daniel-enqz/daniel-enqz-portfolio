class ReviewsController < ApplicationController
  before_action :review_params, only: [:create]

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path, notice: t(".success")
    else
      flash.now[:alert] = @review.errors.full_messages.join(", ")
      render turbo_stream: turbo_stream.replace(:flash_messages, partial: "shared/flash_messages", locals: {heading: t(".error")})
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :email, :first_name, :last_name, :message)
  end
end
