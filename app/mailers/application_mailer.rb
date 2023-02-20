class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper
  default from: Rails.env.production? ? ENV["SENDGRID_EMAIL"] : Rails.application.credentials.sendgrid[:email]
  layout "mailer"
end
