Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }
  resources :posts 
  resources :projects
  resources :contacts, only: [:new, :create]
  resources :users
  resources :videos
  get 'welcome/index'
  root 'welcome#index'

  get '*path' => redirect('/')
end
