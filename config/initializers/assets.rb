# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already adde d.
#Rails.application.config.assets.precompile += [/.*\.js/,/.*\.css/]
# Rails.application.config.assets.precompile += ['jquery.dataTables.min.js',' dataTables.bootstrap.js',' posts.js','dataTables.bootstrap.css','style.css' ]
Rails.application.config.assets.precompile += ['bootstrap.min.js','dataTables.bootstrap.js','posts.js','dataTables.bootstrap.css','font-awesome.css','bootstrap.min.css','jquery.js','jquery_ujs.js','jquery.dataTables.min.js','font-awesome.min.css','dashboard.css']