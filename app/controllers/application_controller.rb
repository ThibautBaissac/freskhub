class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend

  before_action :set_locale
  before_action :authenticate_user!

  private

  def authenticate_user!
    redirect_to new_auth_session_path, alert: "You must sign in or sign up first!" unless user_signed_in?
  end

  def current_user
    Current.user ||= authenticate_user_from_session
  end
  helper_method :current_user

  def authenticate_user_from_session
    User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def login(user)
    Current.user = user
    reset_session
    session[:user_id] = user.id
  end

  def logout(_user)
    Current.user = nil
    reset_session
  end

  def current_user_locale
    current_user&.locale
  end

  def set_locale
    if params[:locale] && !I18n.available_locales.map(&:to_s).include?(params[:locale])
      redirect_to url_for(locale: I18n.default_locale) and return
    end

    I18n.locale = current_user_locale || url_locale || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def url_locale
    params[:locale] if I18n.available_locales.map(&:to_s).include?(params[:locale])
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
