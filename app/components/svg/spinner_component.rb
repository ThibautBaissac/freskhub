class Svg::SpinnerComponent < Svg::BaseComponent
  def initialize
    super
    @classes = "inline h-10 w-10 animate-spin mr-2 text-gray-200 fill-indigo-600"
  end
end
