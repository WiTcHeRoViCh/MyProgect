Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show] do
    resources :profiles, only: [:index, :edit, :update]
  end

  resources :mains, only: [:index]

  root "mains#index"

  get "sign_in" ,  to: "sessions#new"    , as: :sign_in
  get  "sign_out",  to: "sessions#destroy", as: :sign_out
  get  "sign_up" ,  to: "users#new"       , as: :sign_up 
  post "create"  ,  to: 'sessions#create' , as: :sessions
end
