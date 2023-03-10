Rails.application.routes.draw do
  get 'user/profile', to: 'user#profile', as: 'profile'
  get 'user/pofile/edit', to: 'user#edit', as: 'profile_edit'
  put 'user/profile', to: 'user#update' 
  root to: 'home#top'
  get 'home/top'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    get '/users/sign_in', to: 'devise/sessions#new'
    post '/users/sign_in', to: 'devise/sessions#create'
    get '/users/account', to: 'users/registrations#show', as: 'account'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
