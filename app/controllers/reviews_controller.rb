class ReviewsController < ApplicationController
  before_action :review_params, only: [:create]

  def create
    @review = Review.new(review_params)
    if @review.save
      flash.now[:notice] = t(".success", body: "")
      @review = Review.new
      respond_to do |format|
        format.turbo_stream
      end
    else
      flash.now[:alert] = t(".error", body: @review.errors.full_messages.join(", "))
      render turbo_stream: turbo_stream.replace(:flash_messages, partial: "shared/flash_messages")
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :email, :first_name, :last_name, :message)
  end
end
