class RequestMailer < ApplicationMailer
  def received_request(request)
    @request = decorate(request)
    pry
    mail(to: @request.email, subject: t("request_mailer.received_request.subject"))
  end
end
