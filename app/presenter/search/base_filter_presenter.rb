class Search::BaseFilterPresenter
  def apply(filters)
    return {} unless filters[key].present?

    value = find_value(filters[key])

    {localized_key => value}.tap { filters.delete(key) }
  end

  def key
    raise NotImplementedError
  end

  def localized_key
    raise NotImplementedError
  end

  def find_value(_id)
    raise NotImplementedError
  end
end
