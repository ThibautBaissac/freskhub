module Constants
  module Regex
    # based on URI::MailTo::EMAIL_REGEXP from Ruby standard lib but with mandatory TLD
    EMAIL = /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+\z/
    PASSWORD = /\A^.*(?=.{12,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@:,\-?*_()!#$%^&+=]).*$\z/
  end
end
