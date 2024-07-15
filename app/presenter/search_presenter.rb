class SearchPresenter
  def initialize(filter_params)
    @filter_params = filter_params
  end

  def applied_filters
    filters = @filter_params.to_h
    filters.reject! { |_, value| value.blank? }

    if filters["language_id"].present?
      filters["language_id"] = Language.find_by(id: filters["language_id"]).name
      filters[I18n.t("activerecord.models.language")] = filters.delete("language_id")
    end

    if filters["country_id"].present?
      filters["country_id"] = Country.find_by(id: filters["country_id"]).name
      filters[I18n.t("activerecord.models.country")] = filters.delete("country_id")
    end

    if filters["category_id"].present?
      filters["category_id"] = Category.find_by(id: filters["category_id"]).identifier
      filters[I18n.t("activerecord.models.training_session_category")] = filters.delete("category_id")
    end

    if filters["fresk_id"].present?
      filters["fresk_id"] = Fresk.find_by(id: filters["fresk_id"]).name
      filters[I18n.t("activerecord.models.fresk")] = filters.delete("fresk_id")
    end

    if filters["role"].present?
      filters["role"] = I18n.t("training_session.role.#{filters['role']}")
      filters[I18n.t("activerecord.models.training_session_role")] = filters.delete("role")
    end
    filters
  end
end
