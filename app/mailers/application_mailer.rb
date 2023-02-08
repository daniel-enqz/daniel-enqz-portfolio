class ApplicationMailer < ActionMailer::Base
  default from: Rails.env.production? ? ENV[SENDGRID_EMAIL] : Rails.application.credentials.sendgrid[:email]
  layout "mailer"
end
