class Svg::WithTextComponent < ViewComponent::Base
  def initialize(svg:, text:, classes: "text-base")
    @svg = svg
    @text = text
    @classes = classes
  end
end
