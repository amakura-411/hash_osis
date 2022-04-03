Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/index'
  get 'pages/show'
  get 'view'  => 'characters#view'
  resources :characters,          only: [:create, :update]
  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#character; get
