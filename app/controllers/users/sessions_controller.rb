module Users
  # Overwrite devise session methods
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   self.resource = warden.authenticate!(auth_options)
    #   set_flash_message!(:notice, :signed_in)
    #   sign_in(resource_name, resource)
    #   yield resource if block_given?
    #   # respond_with resource, location: after_sign_in_path_for(resource)

    #   build_resource(sign_up_params)
    #   raise resource.inspect
    #   resource.save
    #   yield resource if block_given?
    #   if resource.persisted?
    #     if resource.active_for_authentication?
    #       set_flash_message! :notice, :signed_up
    #       sign_up(resource_name, resource)
    #       respond_with resource, location: after_sign_up_path_for(resource)
    #     else
    #       set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
    #       expire_data_after_sign_in!
    #       respond_with resource, location: after_inactive_sign_up_path_for(resource)
    #     end
    #   else
    #     clean_up_passwords resource
    #     set_minimum_password_length
    #     redirect_to root_path
    #   end
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    protected

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up)
    end

    def build_resource(hash = nil)
      self.resource = resource_class.new_with_session(hash || {}, session)
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
