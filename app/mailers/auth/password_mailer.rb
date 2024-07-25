class Auth::PasswordMailer < ApplicationMailer
  def password_reset
    mail(to: params[:user].email, subject: t("mailer.password_reset.subject"))
  end
end
