# frozen_string_literal: true

class BackButtonComponent < ViewComponent::Base
  def initialize(referer:, host:)
    @referer = referer
    @host = host
  end
end
