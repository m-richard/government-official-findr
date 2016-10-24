Rails.application.routes.draw do
  root 'addresses#index'

  resources :districts do
    resources :addresses
  end
end
