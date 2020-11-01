Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/menu', to: 'users/registrations#menu'
    get 'users/sign_up/step1', to: 'users/registrations#step1'
    get 'users/sign_up/step2', to: 'users/registrations#step2'
    get 'users/sign_up/final', to: 'users/registrations#final'
  end

  resources :users, only: :show

  root to: "funclubs#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
