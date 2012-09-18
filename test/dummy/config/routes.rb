Rails.application.routes.draw do

  mount Wafflemix::Engine => "/"
  devise_for :user

end
