resources :users, only: %i[index show edit update] do
  resources :tabs, only: %i[index], controller: "users/tabs"
end
get "edit_user_locale", to: "users/locale#edit"
patch "update_user_locale", to: "users/locale#update"
