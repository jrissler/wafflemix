Wafflemix::Engine.routes.draw do
  mount Mercury::Engine => '/'

  resources :pages, :only => [:index, :show, :home] do
    member { post :mercury_update }
  end
  resources :images

  namespace :admin do
    resources :pages do
      collection { post :sort }
    end
    resources :users
    resources :roles
    resources :assets
    resources :categories
  end

  devise_for :user

  root :to => "pages#home"

  #this is our catch-all-route
  match '*path' => 'pages#show'
end
