require "active_record"
require "active_record/base"

module MergedDefaultScopes
  module ClassMethods
    def default_scope(options = {})
      super(options)
      unless default_scoping.length == 1
        with_scope(default_scoping.pop) do
          default_scoping.clear
          default_scoping << scoped_methods.last
        end
      end
    end
  end

  def self.included(mod)
    mod.class_eval do
      class << self
        define_method :inherited do |sub|
          sub.extend ClassMethods
          super(sub)
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, MergedDefaultScopes
