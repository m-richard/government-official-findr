Rails.application.routes.draw do
  root 'districts#new'

  resources :districts
end
