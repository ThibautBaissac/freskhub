# frozen_string_literal: true

class Form::LabelComponent < ViewComponent::Base
  def initialize(form:, label: nil, value: "", classes: "block text-sm font-medium text-gray-700 mb-1", for_input: nil)
    @form = form
    @label = label
    @value = value
    @classes = classes
    @for_input = for_input
  end
end
