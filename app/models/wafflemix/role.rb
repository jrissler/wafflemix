module Wafflemix
  class Role < ActiveRecord::Base
    attr_accessible :name

    validates_uniqueness_of :name

    has_many :wafflemix_users, :class_name => 'Wafflemix::User'
    has_many :users, :through => :wafflemix_users
  end
end
