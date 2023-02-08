class RequestsController < ApplicationController
  before_action :request_params, only: [:create]

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path, notice: t(".success") if RequestMailer.received_request(@request).deliver_now
    else
      flash.now[:alert] = @request.errors.full_messages.join(", ")
      render turbo_stream: turbo_stream.replace(:flash_messages, partial: "shared/flash_messages", locals: {heading: t(".error")})
    end
  end

  private

  def request_params
    params.require(:request).permit(:first_name, :last_name, :email, :subject, :message)
  end
end
