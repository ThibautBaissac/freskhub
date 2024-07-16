class Search::LanguageFilter < Search::BaseFilter
  def key
    "language_id"
  end

  def localized_key
    I18n.t("activerecord.models.language")
  end

  def find_value(id)
    Language.find_by(id:).name
  end
end
