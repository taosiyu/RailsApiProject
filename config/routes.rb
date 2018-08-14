Rails.application.routes.draw do
  resources :dcomments
  resources :discoveries
  resources :comments
  resources :cards
  resources :users
  resources :authentication, only: [:create, :edit]
  get '/search', to: 'cards#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
