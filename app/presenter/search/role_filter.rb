class Search::RoleFilter < Search::BaseFilter
  def key
    "role"
  end

  def localized_key
    I18n.t("activerecord.models.training_session_role")
  end

  def find_value(role)
    I18n.t("training_session.role.#{role}")
  end
end
