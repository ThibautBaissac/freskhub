class Auth::SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    # TODO: Use strong parameters
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      login(user)
      redirect_to root_path, notice: t("auth.logged_in")
    else
      flash[:alert] = t("auth.invalid_credentials")
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    logout(current_user)
    redirect_to new_auth_session_path, notice: t("auth.logged_out")
  end
end
