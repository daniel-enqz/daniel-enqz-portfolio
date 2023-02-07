# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
  def received_request
    RequestMailer.received_request(Request.last)
  end
end
