Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'pages#index'
  get 'pages/index'
  get 'pages/show'
  #get    '/index' ,  to: 'characters#index'
  #get '/edit' , to: 'characters#edit'
  get    '/characters/:id/edit' ,  to: 'characters#edit'
  post    '/edit' ,  to: 'characters#edit'
  resources :characters do
    resource :favorites, only: [:create, :destroy] 
  end


  get    '/characters/new', to: 'characters#new'
  post    '/character/new', to: 'characters#new'
  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#character; get
