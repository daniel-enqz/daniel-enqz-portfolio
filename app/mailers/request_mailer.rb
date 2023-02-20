class RequestMailer < ApplicationMailer
  def received_request(request)
    @request = decorate(request) # Another way to decorate a model: RequestDecorator.decorate(request)
    mail(to: @request.email, subject: t("request_mailer.received_request.subject"))
  end
end
