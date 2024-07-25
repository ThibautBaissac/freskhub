namespace :searches do
  resource :modal, only: %i[show]
  resources :results, only: %i[index]
  resources :tabs, only: %i[index], controller: "tabs"
end
