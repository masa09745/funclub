Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/sign_up/step1', to: 'users/registrations#step1'
    get 'users/sign_up/step2', to: 'users/registrations#step2'
    get 'users/sign_up/step3', to: 'users/registrations#step3'
    post 'users/sign_up/final', to: 'users/registrations#final'
  end

  resource :user, only: :show do
    collection do
      get 'logout', to: 'users#logout'
      resource :card
    end
  end

  resources :schedules, only: [:index, :show]
    namespace :admin do
      resources :schedules
    end

  resources :stocks

  resources :admins, only: :index

  root to: "funclubs#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end