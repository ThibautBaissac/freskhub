class Svg::WithTextComponent < ViewComponent::Base
  def initialize(svg:, text:)
    @svg = svg
    @text = text
  end
end
