Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    root to: "fresks#index"
    get "up" => "rails/health#show", as: :rails_health_check

    draw :administration
    draw :auth
    draw :billings
    draw :fresks
    draw :training_sessions
    draw :users
    match "/404", to: "errors#not_found", via: :all
    match "/500", to: "errors#internal_server_error", via: :all
  end
end
