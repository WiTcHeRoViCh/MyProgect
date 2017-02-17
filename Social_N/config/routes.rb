Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :users, only: [:new, :show, :create] do
    resources :profiles, only: [:show, :edit, :update]
  end

  resources :mains, only: [:index]
  resources :comments

  get  'sign_up',  to: 'users#new',        as: :sign_up
  get  'sign_in',  to: 'sessions#new',     as: :sign_in
  get  'sign_out', to: 'sessions#destroy', as: :sign_out
  post 'create',   to: 'sessions#create',  as: :sessions

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
