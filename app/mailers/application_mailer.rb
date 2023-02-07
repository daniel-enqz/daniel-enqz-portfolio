class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.sendinblue[:user_name]
  layout "mailer"
end
