Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/index'
  get 'pages/home'
#================キャラクターについて================================
#==========タグについて==========

  #==============キャラをお気に入りにできる=========
  resources :characters do
    resource :favorites, only: [:create, :destroy]
  end
  #get 'elements/:id',to: 'characters#elements'
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
get 'user/search', to:'users#search'
#collection=idのつかないURL || member=idが付くURL をそれぞれ生成
#================検索機能の実装（キャラクター）================
resources :characters do
  collection do
    get 'search'
  end
end
  get 'character/search', to:'characters#search'
end

