$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'merged_default_scopes'
require 'rspec'
require "sqlite3"

ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => ":memory:"
)
ActiveRecord::Migration.verbose = false
load(File.dirname(__FILE__) + "/db/schema.rb")

class AuditableModel < ActiveRecord::Base; end


