Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'home#index'

  resources :users do
    get :account, on: :member
  end
end
