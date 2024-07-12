# frozen_string_literal: true

class Form::ErrorMessagesComponent < ViewComponent::Base
  def initialize(object:)
    @object = object
  end
end
