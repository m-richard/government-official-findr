Rails.application.routes.draw do
  root 'districts#new'

  resources :districts do
    resources :addresses
  end

  resources :districts
end
