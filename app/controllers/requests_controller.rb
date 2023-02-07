class RequestsController < ApplicationController
  before_action :request_params, only: [:create]

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path
    else
      render "pages/home"
    end
  end

  private

  def request_params
    params.require(:request).permit(:first_name, :last_name, :email, :subject, :message)
  end
end
