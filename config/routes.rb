Wafflemix::Engine.routes.draw do
  mount Mercury::Engine => '/'

  resources :assets

  resources :pages, :only => [:index, :show, :home] do
    member { post :mercury_update }
  end

  resources :posts, :only => [:index, :show] do
    post :mercury_update, :on => :member
    get :tagged, :on => :member
  end

  resources :portfolios, :only => [:index, :show] do
    member { post :mercury_update }
  end

  resources :categories
  resources :contact_forms

  namespace :admin do
    resources :pages do
      collection { post :sort }
    end
    resources :slides do
      collection { post :sort }
    end
    resources :users
    resources :roles
    resources :assets
    resources :categories
    resources :content_sections
    resources :posts
    resources :contact_forms
    resources :portfolios do
      collection { post :sort }
    end
    resources :assets do
      collection { post :add_image }
    end
  end

  devise_for :users, {
    class_name: '::Wafflemix::User',
    module: :devise,
  }

  match "/contact-us" => "contact_forms#new"

  root :to => "pages#home"

  #this is our catch-all-route
  match '*path' => 'pages#show'
end
