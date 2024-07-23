# frozen_string_literal: true

class Form::LabelComponent < ViewComponent::Base
  def initialize(form:, label: nil, value: "", classes: "block text-sm font-medium text-gray-700 mb-1")
    @form = form
    @label = label
    @value = value
    @classes = classes
  end
end
