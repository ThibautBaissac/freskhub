class FreskDecorator < SimpleDelegator
  def translation(language, field)
    translation = Translations::Fetcher.new(self, language, field).call
    translation&.content
  end

  # TODO: Implement method_missing
  def short_description(language)
    translation(language, :short_description)
  end

  def long_description(language)
    translation(language, :long_description)
  end
end
