Wafflemix::Engine.routes.draw do
  mount Mercury::Engine => '/'

  resources :pages, :only => [:index, :show, :home] do
    member { post :mercury_update }
  end

  resources :posts, :only => [:index, :show] do
    member { post :mercury_update }
  end

  resources :images
  resources :categories

  namespace :admin do
    resources :pages do
      collection { post :sort }
    end
    resources :slides do
      collection { post :sort}
    end
    resources :users
    resources :roles
    resources :assets
    resources :categories
    resources :content_sections
    resources :posts
  end

  devise_for :users, {
    class_name: '::Wafflemix::User',
    module: :devise,
  }

  root :to => "pages#home"

  #this is our catch-all-route
  match '*path' => 'pages#show'
end
