require_dependency "wafflemix/application_controller"

module Wafflemix
  class SessionsController < ::Devise::SessionsController
    # the rest is inherited, so it should work
  end
end
