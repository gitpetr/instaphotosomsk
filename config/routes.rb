Rails.application.routes.draw do
  get 'profiles/show'

  resources :photos
  devise_for :users
  root 'pages#landing'
  get 'pages/about' 
  get '/profiles/:id' => 'profiles#show', as: "profile" 
end
