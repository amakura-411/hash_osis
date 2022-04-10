Rails.application.routes.draw do

  root 'pages#index'
  get 'pages/index'
  get 'pages/show'
#================キャラクターについて================================
  get    '/characters/:id/edit', to: 'characters#edit'
  post    '/edit', to: 'characters#edit'
  post    '/character/new', to: 'characters#new'
  #==============キャラをお気に入りにできる=========
  resources :characters do
    resource :favorites, only: [:create, :destroy]
  end

#================デバイスによるログイン機能の実装==========================================-
  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

#================ユーザーの推しがみられるようにする=============================
  resources :users, :only =>[:index, :show] do
    resource :favorites
  end


#================検索機能の実装（ユーザー）================================
resources :users do
  collection do
    get 'search'
  end
end
  get '/user/search', to:"users#search"
#collection=idのつかないURL || member=idが付くURL をそれぞれ生成

end

