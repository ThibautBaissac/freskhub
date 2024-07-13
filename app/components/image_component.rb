# frozen_string_literal: true

class ImageComponent < ViewComponent::Base
  def initialize(image_path:, options: {})
    @image_path = image_path
    @options = options
  end

  def image_source
    asset_exists?(@image_path) ? @image_path : "default.png"
  end

  private

  def asset_exists?(image_path)
    Rails.application.assets.load_path.paths.any? do |path|
      File.exist?(File.join(path, image_path))
    end
  end
end
