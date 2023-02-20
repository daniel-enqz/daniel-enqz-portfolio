class RequestMailerPreview < ActionMailer::Preview
  def received_request
    RequestMailer.received_request(Request.last)
  end
end
