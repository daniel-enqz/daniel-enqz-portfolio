# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
  def received_request(request)
    @request = request
    mail(to: @request.email, subject: t("request_mailer.received_request.subject"))
  end
end
