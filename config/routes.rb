Wafflemix::Engine.routes.draw do
  mount Mercury::Engine => '/'

  resources :pages, :only => [:index, :show, :home]
  resources :images

  namespace :admin do
    resources :pages do
      collection { post :sort }
    end
    resources :users
    resources :roles
    resources :assets
  end

  root :to => "pages#home"

  #this is our catch-all-route
  match '*path' => 'pages#show'
end
