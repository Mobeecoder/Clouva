class AdminController < Devise::RegistrationsController
  def index
  end

  def new
    # This block is passed to the super class implementation:
    super
  end

  def create
    super do |resource|
      @errors = resource.errors.full_messages
    end

    # flash.alert = "Welcome back #{current_user.name}." #if flash.key?(:notice)
    # redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # This is the method Devise devise calls for the params.
  def sign_up_params
    # Don't write your params sanitiation on one line! Its not cool.
    params.require(:admin)
          .permit(
              :password, :email, :merchant
          )
  end
end
