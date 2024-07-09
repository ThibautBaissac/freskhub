class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def current_user
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

  def current_user_locale
    current_user&.locale
  end

  def url_locale
    params[:locale] if I18n.available_locales.map(&:to_s).include?(params[:locale])
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
