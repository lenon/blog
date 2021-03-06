require "rubygems"
require "bundler/setup"

Bundler.require(:default)

Mongoid.load!("config/mongoid.yml", ENV["RACK_ENV"])
Mongoid.raise_not_found_error = false
Mongoid.allow_dynamic_fields  = false

I18n.default_locale = :"pt-BR"
I18n.load_path += Dir["locales/*.yml"]

require "lib/assets"
require "lib/markdown/processor"
require "app/helpers/application_helpers"
require "app/models/admin"
require "app/models/post"
require "app/models/settings"
require "app/controllers/application_controller"
require "app/controllers/blog_controller"
require "app/controllers/admin_controller"
