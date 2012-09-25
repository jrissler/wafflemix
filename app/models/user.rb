class User < ActiveRecord::Base
  self.table_name = 'wafflemix_users'

  attr_accessible :email, :username, :password, :password_confirmation, :remember_me

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :wafflemix_roles, :class_name => 'Wafflemix::Role'
  has_many :roles, :through => :wafflemix_roles
end