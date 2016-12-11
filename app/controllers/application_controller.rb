# app/controllers/application_record.rb
# To abstract ActiveController in Website
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, if: :devise_controller?
  before_action :set_locale
  helper_method :resource_name, :resource, :devise_mapping

  def after_sign_in_path_for(resource)
    account_user_path(resource)
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # def authenticate_user!
  #   if user_signed_in?
  #     super
  #   else
  #     redirect_to root_path, :notice => 'if you want to add a notice'
  #     ## if you want render 404 page
  #     ## render :file => File.join(Rails.root, 'public/404'),
  #               :formats => [:html], :status => 404, :layout => false
  #   end
  # end
end
