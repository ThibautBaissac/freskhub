# frozen_string_literal: true

class MapComponent < ViewComponent::Base
  def initialize(geocoded_instances:, popup_content: nil)
    @geocoded_instances = geocoded_instances
    @popup_content = popup_content
  end
end
