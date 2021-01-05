Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/sign_up/menu', to: 'users/registrations#menu'
    get 'users/sign_up/step1', to: 'users/registrations#step1'
    get 'users/sign_up/step2', to: 'users/registrations#step2'
    get 'users/sign_up/step3', to: 'users/registrations#step3'
    post 'users/sign_up/final', to: 'users/registrations#final'

    get 'users/sign_in/menu', to: 'users/sessions#menu'
  end

  resources :users, only: :show

  resources :schedules

  resources :stocks

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :schedules, only: [:index, :show, :destroy]
    end
  end

  resources :managements


  

  root to: "funclubs#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
