class PagesController < ApplicationController
  def home
    @review = Review.new
  end
end
