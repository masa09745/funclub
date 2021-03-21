Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/sign_up/step1', to: 'users/registrations#step1'
    get 'users/sign_up/step2', to: 'users/registrations#step2'
    get 'users/sign_up/card', to: 'users/registrations#card'
    post 'users/sign_up/final', to: 'users/registrations#final'
  end

  resource :user, only: :show do
    resource :card
    get 'logout', to: 'users#logout'
  end

  resources :schedules, only: [:index, :show]

  namespace :admin do
    resources :schedules, only: [:index, :new, :create, :edit, :update, :destroy]  do
      collection {post :import}
      resource :stocks, only: :show
    end
    resources :stocks, only: [:index, :new, :create] do
      collection {post :import}
    end
  end

  resource :admin, only: :show

  root to: "funclubs#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end