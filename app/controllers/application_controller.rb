# app/controllers/application_record.rb
# To abstract ActiveController in Website
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
