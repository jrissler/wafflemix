module Wafflemix
  class Engine < ::Rails::Engine
    isolate_namespace Wafflemix

    initializer 'ActiveAdmin precompile hook' do |app|
    app.config.assets.precompile += ['admin/admin_js.js', 'admin/admin.css']
    end
  end
end
