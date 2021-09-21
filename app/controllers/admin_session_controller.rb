class AdminSessionController < Devise::SessionsController
  before_action :configure_permitted_parameters

  def new
    super
  end

  def create
    super do |resource|
      resource
    end
  end

  private

  # # This is the method Devise devise calls for the params.
  # def sign_in_params
  #   # Don't write your params sanitiation on one line! Its not cool.
  #   params.require(:admin)
  #         .permit(
  #             :password, :email, :merchant
  #         )
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:admin) { |u| u.permit(:email, :password ) }
    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :name, :user_age, :user_gender, :user_bio ) }
    
  end
end
