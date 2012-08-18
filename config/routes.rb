Wafflemix::Engine.routes.draw do
  resources :pages, :only => [:index, :show]

  namespace :admin do
    resources :pages
  end

  root :to => "pages#index"
end
