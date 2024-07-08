class TrainingSessionDecorator < SimpleDelegator
  def fresk
    category.fresk
  end

  def location
    "online"
  end

  def datetime_and_location
    start_time = I18n.l(start_at, format: "%A, %d • %b %Y %l:%M%p")
    end_time = I18n.l(end_at, format: "%l:%M%p")
    [start_time, end_time, location].join(" • ")
  end
end
