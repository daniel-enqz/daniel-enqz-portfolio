class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.sendgrid[:email]
  layout "mailer"
end
