# app/controllers/application_record.rb
# To abstract ActiveController in Website
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, if: :devise_controller?
  helper_method :resource_name, :resource, :devise_mapping

  def after_sign_in_path_for(resource)
    puts "connection"
    account_user_path(resource)
    # sign_in_url = new_user_session_url
    # if request.referer == sign_in_url
    #   super
    # else
    #   root_path
    # end
  end

  # def after_sign_out_path_for(resource_or_scope)
  #   puts "deconnection"
  #   raise "foo"
  #   root_path
  # end

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

  # def authenticate_user!
  #   if user_signed_in?
  #     super
  #   else
  #     redirect_to root_path, :notice => 'if you want to add a notice'
  #     ## if you want render 404 page
  #     ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
  #   end
  # end
end
