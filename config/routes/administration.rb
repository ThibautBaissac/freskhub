namespace :administration do
  resources :components, only: [:index]
  resources :users, only: [:index]
end
