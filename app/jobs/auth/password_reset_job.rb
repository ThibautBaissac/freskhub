class Auth::PasswordResetJob < ApplicationJob
  queue_as :default

  def perform(user:)
    Auth::PasswordMailer.with(
      user:, token:
      user.generate_token_for(:password_reset)
    ).password_reset.deliver_later
  end
end
