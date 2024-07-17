class Search::CountryFilter < Search::BaseFilterPresenter
  def key
    "country_id"
  end

  def localized_key
    I18n.t("activerecord.models.country")
  end

  def find_value(id)
    Country.find_by(id:).name
  end
end
