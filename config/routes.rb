Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get '/home/about' => 'homes#about'
  get '/search', to: 'searchs#search'

  resources :users,only: [:show,:index,:edit,:update] do
     get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  resource :relationships, only: [:create, :destroy]
  end

  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
end

end