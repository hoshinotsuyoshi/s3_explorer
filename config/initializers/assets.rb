# frozen_string_literal: true
Rails.application.configure do
  config.assets.version = '1.0'
  config.assets.paths << Rails.root.join('node_modules')
  config.assets.precompile << 'gentelella/build/js/custom.min.js'
  config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
end
