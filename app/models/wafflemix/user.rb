module Wafflemix
  class User < ActiveRecord::Base
    attr_accessor :login
    attr_accessor :password
    
    attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :login

    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

    has_many :wafflemix_roles, :class_name => 'Wafflemix::Role'
    has_many :roles, :through => :wafflemix_roles
  end
end
