require "rubygems"
require "bundler/setup"

$LOAD_PATH.unshift File.expand_path('..', __FILE__)

require "config/boot"

map("/") { run BlogApp }
map("/admin") { run AdminApp }
