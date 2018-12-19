Rails.application.routes.draw do
  resources :categories
  resources :topics
  resources :resources
  get 'session/new'
  get 'main/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  resources :session, only: [:new, :create, :destroy]
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
end
