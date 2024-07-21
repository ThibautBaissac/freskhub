class User < ApplicationRecord
  include User::Associations
  include User::Scopes
  include User::Validations

  has_secure_password
  encrypts :email, deterministic: true, downcase: true

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  def admin_for_fresk?(fresk)
    user_infos.find_by(fresk:, role: User::Info::Admin).present?
  end

  def admin?
    user_infos.any?(&:admin?)
  end

  def to_param
    uuid
  end

  private

  def last_login_at_cannot_be_in_the_future
    return unless last_login_at.present? && last_login_at > Time.now

    errors.add(:last_login_at, "can't be in the future")
  end
end
