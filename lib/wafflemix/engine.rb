module Wafflemix
  class Engine < ::Rails::Engine
    isolate_namespace Wafflemix

    initializer 'ActiveAdmin precompile hook' do |app|
    app.config.assets.precompile += ['application.js', 'application.css']
    end
  end
end
