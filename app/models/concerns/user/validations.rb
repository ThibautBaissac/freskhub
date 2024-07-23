module User::Validations
  extend ActiveSupport::Concern

  included do
    validates :uuid, presence: true, uniqueness: true
    validates :locale, presence: true, inclusion: {in: I18n.available_locales.map(&:to_s)}
    validates :country, presence: true
    validates :latitude, numericality: {greater_than_or_equal_to: -90, less_than_or_equal_to: 90}, allow_nil: true
    validates :longitude, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}, allow_nil: true
    validates :email, presence: true, uniqueness: true,
                      format: {with: Constants::Regex::EMAIL, message: "must be a valid email address"}

    validate :last_login_at_cannot_be_in_the_future

    # (?=.{12,}) : at least 12 chars
    # (?=.*\d) : at least 1 number
    # (?=.*[a-z]) : at least 1 downcase letter
    # (?=.*[A-Z]) : at least 1 uppercase letter
    # (?=.*[@:,\-?*_()!#$%^&+=]) : at least 1 of these special chars
    # validates :password, format: Constants::Regex::PASSWORD, if: proc { |u| u.password.present? }
    # TODO: Uncomment the line above and remove the line below when the password regex is ready
    validates :password, length: {minimum: 1}, if: proc { |u| u.password.present? }
  end
end
