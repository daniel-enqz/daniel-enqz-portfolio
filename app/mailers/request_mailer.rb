class RequestMailer < ApplicationMailer
  def received_request(request)
    @request = request
    mail(to: @request.email, subject: t("request_mailer.received_request.subject")) # This will be in config/locales/en.yml
  end
end
