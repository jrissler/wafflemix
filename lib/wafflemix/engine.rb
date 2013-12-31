module Wafflemix
  class Engine < ::Rails::Engine
    isolate_namespace Wafflemix

    initializer 'Precompile hook' do |app|
      app.config.assets.precompile += %w( wafflemix/admin/admin_js.js wafflemix/admin/admin.css jquery-1.7.js mercury.js wafflemix/mercury.js mercury/toolbar.js )
    end
  end
end
