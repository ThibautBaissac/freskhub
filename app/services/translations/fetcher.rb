module Translations
  class Fetcher
    def initialize(translatable, language, field)
      @translatable = translatable
      @language = language
      @field = field
    end

    def call
      Rails.cache.fetch(cache_key, expires_in: 12.hours) do
        fetch_translation
      end
    end

    private

    def fetch_translation
      @translatable.translations.find_by(language: @language, field: @field) || fallback_translation
    end

    def fallback_translation
      @translatable.translations.find_by(language: "en", field: @field)
    end

    def cache_key
      "translation_#{@translatable.class.name}_#{@field}_#{@translatable.id}_#{@language}"
    end
  end
end
