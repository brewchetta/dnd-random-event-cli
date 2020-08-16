require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'
require 'io/console'

require "bundler/setup"
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite3"
)

require_all "lib"
