class Users::LocaleController < ApplicationController
  def edit
  end

  def update
    if current_user && params[:new_locale].in?(I18n.available_locales.map(&:to_s))
      current_user.update(locale: params[:new_locale])
      I18n.locale = params[:new_locale]
      session[:locale] = I18n.locale
      redirect_back_or_to(root_path)
    else
      redirect_to(root_path, alert: "Invalid locale or user.")
    end
  end
end
