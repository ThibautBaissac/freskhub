class Search::FreskFilter < Search::BaseFilterPresenter
  def key
    "fresk_id"
  end

  def localized_key
    I18n.t("activerecord.models.fresk")
  end

  def find_value(id)
    Fresk.find_by(id:).name
  end
end
