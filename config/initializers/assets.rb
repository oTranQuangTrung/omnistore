Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
assets_javascripts = %w(core/app.js plugins/ui/nicescroll.min.js) + Dir["#{Rails.root.to_s}/app/assets/javascripts/pages/*.{js}"]
assets_stylesheets = %w()

Rails.application.config.assets.precompile += assets_javascripts + assets_stylesheets
