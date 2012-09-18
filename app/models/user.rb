class User < ActiveRecord::Base
  self.table_name = 'wafflemix_users'

  attr_accessor :login
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :login

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  has_many :wafflemix_roles, :class_name => 'Wafflemix::Role'
  has_many :roles, :through => :wafflemix_roles

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end