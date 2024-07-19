class Auth::RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    return # TODO: Remove this line to enable registration
    @user = User.new(registration_params)
    if @user.save
      login(@user)
      redirect_to root_path, notice: t("auth.signed_up")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def registration_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
