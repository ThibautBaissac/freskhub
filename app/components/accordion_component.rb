# frozen_string_literal: true

class AccordionComponent < ViewComponent::Base
  def initialize(items:, single_open: false)
    @items = items
    @single_open = single_open
  end
end
