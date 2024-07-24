# frozen_string_literal: true

class Form::PasswordVisibilityComponent < ViewComponent::Base
  def initialize(form:, field:, options: {})
    @form = form
    @field = field
    @options = options
  end

  def password_data_attributes
    {password_visibility_target: :password}.merge(@options[:data] || {})
  end
end
