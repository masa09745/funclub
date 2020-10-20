Rails.application.routes.draw do
  devise_for :users, contorllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/menu', to: 'users/registrations#menu'
  end
  resources :users, only: :show

  root to: "funclubs#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
