class Auth::PasswordResetsController < ApplicationController
  before_action :set_user_by_token, only: %i[edit update]
  skip_before_action :authenticate_user!, only: %i[new edit create update]

  def new
  end

  def create
    if (user = User.find_by(email: params[:email]&.downcase&.strip))
      Auth::PasswordMailer.with(
        user:, token:
        user.generate_token_for(:password_reset)
      ).password_reset.deliver_later
      redirect_to new_auth_session_path, notice: t("auth.password_reset_email_sent")
    else
      redirect_to new_auth_password_reset_path, alert: t("auth.invalid_credentials")
    end
  end

  def edit
  end

  def update
    if @user.update(password_params)
      redirect_to new_auth_session_path, notice: t("auth.password_reset_successful")
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  private

  def set_user_by_token
    @user = User.find_by_token_for(:password_reset, params[:token])
    redirect_to new_auth_password_reset_path, alert: "Invalid token, please try again." unless @user
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
