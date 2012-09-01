module Wafflemix
  class User < ActiveRecord::Base
    attr_accessor :login
    attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :login

    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  end
end
