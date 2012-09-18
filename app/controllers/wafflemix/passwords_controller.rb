require_dependency "wafflemix/application_controller"

module Wafflemix
  class PasswordsController < ::Devise::PasswordsController
    # the rest is inherited, so it should work
  end
end
