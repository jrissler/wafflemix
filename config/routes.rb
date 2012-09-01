Wafflemix::Engine.routes.draw do
  mount Mercury::Engine => '/'

  resources :pages, :only => [:index, :show]

  namespace :admin do
    resources :pages
  end

  root :to => "pages#index"
end
