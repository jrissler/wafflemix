module Wafflemix
  class UserRole < ActiveRecord::Base
    attr_accessible :role_id, :user_id

    belongs_to :wafflemix_role, :class_name => 'Wafflemix::Role'
    belongs_to :wafflemix_user, :class_name => 'Wafflemix::User'
  end
end
