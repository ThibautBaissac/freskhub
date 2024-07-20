resources :users, only: %i[index show edit update]
get "edit_user_locale", to: "users/locale#edit"
patch "update_user_locale", to: "users/locale#update"
