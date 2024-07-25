# frozen_string_literal: true

class TabComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(tabs:, active_tab:)
    @tabs = tabs
    @active_tab = active_tab
  end

  def tab_class(tab)
    if @active_tab == tab
      "w-full px-3 md:px-4 py-1 md:py-2 text-center rounded-full border bg-indigo-600 text-white hover:bg-indigo-800"
    else
      "w-full px-3 md:px-4 py-1 md:py-2 text-center rounded-full border text-dark hover:bg-gray-300"
    end
  end
end
