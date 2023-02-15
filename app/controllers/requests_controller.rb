class RequestsController < ApplicationController
  before_action :request_params, only: [:create]

  def create
    @request = Request.new(request_params)
    if @request.save
      RequestMailer.received_request(@request).deliver_now
      flash.now[:success] = {type: :success, message: t(".success"), body: ""}
      @request = Request.new
      respond_to do |format|
        format.turbo_stream
      end
    else
      flash.now[:error] = {type: :error, message: t(".error"), body: @request.errors.full_messages.join(", ")}
      render turbo_stream: turbo_stream.replace(:flash_messages, partial: "shared/flash_messages")
    end
  end

  private

  def request_params
    params.require(:request).permit(:first_name, :last_name, :email, :subject, :message)
  end
end
