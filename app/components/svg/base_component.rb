class Svg::BaseComponent < ViewComponent::Base
  def initialize(classes: "w-8 h-8 stroke-gray-600", stroke_width: 2, fill: "none")
    @classes = classes
    @fill = fill
    @stroke_width = stroke_width
  end
end
