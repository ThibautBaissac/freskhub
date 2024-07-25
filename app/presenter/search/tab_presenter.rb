class Search::TabPresenter
  include Rails.application.routes.url_helpers

  def initialize(tab:)
    @tab = tab
  end

  def call
    active_tab = @tab || "training_session_form"
    [tabs, active_tab]
  end

  private

  def tabs
    [
      {
        key: "training_session_form",
        name: I18n.t("training_session.session", count: 2),
        path: searches_tabs_path(tab: "training_session_form")
      },
      {
        key: "user_form",
        name: I18n.t("activerecord.models.user").pluralize,
        path: searches_tabs_path(tab: "user_form")
      }
    ]
  end
end
