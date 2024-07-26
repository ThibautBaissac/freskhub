class Search::QueryFilter < Search::BaseFilterPresenter
  def key
    "query"
  end

  def localized_key
    I18n.t("search.term")
  end

  def find_value(query)
    query
  end
end
