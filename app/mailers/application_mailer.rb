# app/mailers/application_mailer.rb
# To abstract ActionMailer in Website
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
