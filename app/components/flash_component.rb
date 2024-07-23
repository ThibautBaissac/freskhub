# frozen_string_literal: true

class FlashComponent < ViewComponent::Base
  def initialize(message:, type: :primary, size: :md, closable: true)
    @message = message
    @type = type
    @size = size
    @closable = closable
  end

  def bg_color
    {
      primary: "bg-indigo-200",
      secondary: "bg-gray-300",
      success: "bg-green-200",
      warning: "bg-amber-200",
      danger: "bg-red-500"
    }[@type]
  end

  def text_color
    {
      primary: "text-indigo-800",
      secondary: "text-gray-900",
      success: "text-green-800",
      warning: "text-amber-800",
      danger: "text-gray-100"
    }[@type]
  end

  def border_color
    {
      primary: "border-indigo-400",
      secondary: "border-gray-400",
      success: "border-green-400",
      warning: "border-amber-400",
      danger: "border-red-900"
    }[@type]
  end
end
