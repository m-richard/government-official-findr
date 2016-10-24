Rails.application.routes.draw do
  root 'addresses#new'

  resources :districts do
    resources :addresses
  end

  resources :addresses
end
