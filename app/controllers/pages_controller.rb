class PagesController < ApplicationController
  def home
    @review = Review.new
    @request = Request.new
  end
end
