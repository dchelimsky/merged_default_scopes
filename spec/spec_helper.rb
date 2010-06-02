$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rubygems'
require 'merged_default_scopes'
require 'rspec'
adapter = nil
config = { :database => ":memory:" }
if RUBY_PLATFORM =~ /java/
  require "jdbc/sqlite3"
  require "active_record/connection_adapters/jdbcsqlite3_adapter"
  config[:adapter]  = "jdbcsqlite3"
else
  require "sqlite3"
  config[:adapter]  = "sqlite3"
end

ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
ActiveRecord::Base.establish_connection(config)
ActiveRecord::Migration.verbose = false
load(File.dirname(__FILE__) + "/db/schema.rb")
