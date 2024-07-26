class Auth::SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    if (user = User.authenticate_by(email: params[:email], password: params[:password]))
      forwarding_url = session.delete(:forwarding_url) || root_path
      login(user)
      user.update(last_login_at: DateTime.current)
      redirect_to(forwarding_url, notice: t("auth.logged_in"))
    else
      flash[:alert] = t("auth.invalid_credentials")
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    logout(current_user)
    redirect_to(new_auth_session_path, notice: t("auth.logged_out"))
  end
end
