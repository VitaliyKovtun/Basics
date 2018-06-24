Rails.application.routes.draw do
  root 'home#show'

  devise_for :users

  resource :profile, only: %i[show edit update]
end
