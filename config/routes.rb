Rails.application.routes.draw do
  root to: 'sessions#tuesday'
  get '/tuesday', to: 'sessions#tuesday', as: 'tuesday'
  get '/wednesday', to: 'sessions#wednesday', as: 'wednesday'
  resources :sessions, only: [:show]
end
