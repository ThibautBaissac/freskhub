class Svg::ChevronComponent < Svg::BaseComponent
  def initialize(direction: :right, classes: "w-8 h-8 stroke-gray-600", stroke_width: 2)
    super(classes:, stroke_width:)
    @direction = direction
  end
end
