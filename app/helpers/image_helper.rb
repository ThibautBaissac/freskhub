module ImageHelper
  def safe_image_tag(image_path, options = {})
    if asset_exists?(image_path)
      image_tag(image_path, options)
    else
      image_tag("default.png", options)
    end
  end

  private

  def asset_exists?(image_path)
    Rails.application.assets.load_path.paths.any? do |path|
      File.exist?(File.join(path, image_path))
    end
  end
end
