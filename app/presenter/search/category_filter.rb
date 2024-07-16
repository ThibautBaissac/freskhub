class Search::CategoryFilter < Search::BaseFilter
  def key
    "category_id"
  end

  def localized_key
    I18n.t("activerecord.models.training_session_category")
  end

  def find_value(id)
    TrainingSession::Category.find_by(id:).identifier
  end
end
