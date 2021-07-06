class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:merchant]) # { |u| u.permit(:email, :password, :password_confirmation, :merchant ) }
        # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :name, :user_age, :user_gender, :user_bio ) }
        
    end
end
