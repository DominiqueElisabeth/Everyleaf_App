Rails.application.routes.draw do
  resources :tasks
  resources :users
  resources :sessions

  namespace :admin do
    resources :users, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    end
  end
  root 'sessions#new'
end
