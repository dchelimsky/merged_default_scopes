require "active_record"
require "active_record/base"

module MergedDefaultScopes
  module ClassMethods
    def default_scope(options = {})
      new_scope = { :find => options, :create => options[:conditions].is_a?(Hash) ? options[:conditions] : {} }
      if scoped_methods.empty?
        self.default_scoping << new_scope
        self.scoped_methods << new_scope
      else
        with_scope(new_scope) do
          self.default_scoping << current_scoped_methods
          self.scoped_methods << current_scoped_methods
        end
      end
    end

    def clear_default_scope
      default_scoping.clear
      scoped_methods.clear
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
