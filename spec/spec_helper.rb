ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'bundler'

Bundler.setup

unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec/"
  end
end

$LOAD_PATH.unshift File.expand_path('../..', __FILE__)

ENV["SETTINGS_FILE"] = "spec/settings.yml"

require 'rspec'
require 'rack/test'
require 'factory_girl'
require 'app/boot'

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include FactoryGirl::Syntax::Methods

  config.before do
    Admin.delete_all
    Post.delete_all
  end
end
