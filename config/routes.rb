Rails.application.routes.draw do
  root 'states#new'

  resources :states
end
