# frozen_string_literal: true

class MapComponent < ViewComponent::Base
  def initialize(geocoded_instances:, popup_content: nil, height: "400px")
    @geocoded_instances = geocoded_instances
    @popup_content = popup_content
    @height = height
  end
end
