module Wafflemix
  class Role < ActiveRecord::Base
    attr_accessible :name

    validates_uniqueness_of :name

    has_many :wafflemix_user_roles, :class_name => 'Wafflemix::UserRole'
    has_many :users, :through => :wafflemix_user_roles, :class_name => 'Wafflemix::User'
  end
end
