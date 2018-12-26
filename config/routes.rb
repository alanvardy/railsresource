Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  get 'session/new'
  get 'main/index'
  get 'dark', to: 'session#dark'
  get 'light', to: 'session#light'

  resources :sources
  resources :categories
  resources :topics
  resources :resources
  resources :session, only: [:new, :create, :destroy]

  get '/check.txt', to: proc {[200, {}, ['it_works']]}
  get '/:id', to: 'main#index'
end
