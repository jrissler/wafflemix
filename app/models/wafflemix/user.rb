module Wafflemix
  class User < ActiveRecord::Base

    attr_accessible :email, :username, :password, :password_confirmation, :remember_me

    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

    has_many :wafflemix_user_roles, :class_name => 'Wafflemix::UserRole'
    has_many :roles, :through => :wafflemix_user_roles, :class_name => 'Wafflemix::Role'
  end
end
