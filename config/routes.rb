Wafflemix::Engine.routes.draw do
  mount Mercury::Engine => '/'

  resources :pages, :only => [:index, :show, :home]
  resources :images

  namespace :admin do
    resources :pages
  end

  root :to => "pages#home"
end
