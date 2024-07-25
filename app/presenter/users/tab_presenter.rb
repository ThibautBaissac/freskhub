class Users::TabPresenter
  include Rails.application.routes.url_helpers

  def initialize(user:, tab:)
    @user = user
    @tab = tab
  end

  def call
    active_tab = @tab || "profile"
    [tabs, active_tab]
  end

  private

  def tabs
    [
      {
        key: "profile",
        name: I18n.t("user.profile"),
        path: user_tabs_path(user_id: @user.uuid, tab: "profile")
      },
      {
        key: "sessions",
        name: I18n.t("training_session.session", count: 2),
        path: user_tabs_path(user_id: @user.uuid, tab: "sessions")
      },
      {
        key: "participants",
        name: "Participants",
        path: user_tabs_path(user_id: @user.uuid, tab: "participants")
      }
    ]
  end
end
