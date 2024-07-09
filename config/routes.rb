Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: "fresks#index"
    get "up" => "rails/health#show", as: :rails_health_check

    draw :administration
    draw :billings
    draw :fresks
    draw :training_sessions
    draw :users
  end
end
