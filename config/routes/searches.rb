namespace :searches do
  resource :modal, only: %i[show]
  resources :results, only: %i[index]
end
