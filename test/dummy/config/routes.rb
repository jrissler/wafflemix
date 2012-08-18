Rails.application.routes.draw do

  mount Wafflemix::Engine => "/wafflemix"

  root :to => 'pages#index'
end
