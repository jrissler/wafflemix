Rails.application.routes.draw do

  mount Mercury::Engine => '/'

  mount Wafflemix::Engine => "/"
  devise_for :user

end
