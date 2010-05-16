require "active_record"
require "active_record/base"

module MergedDefaultScopes
  module ClassMethods
    def default_scope(options = {})
      if default_scoping.empty?
        super(options)
      else
        with_scope(:find => options, :create => options[:conditions].is_a?(Hash) ? options[:conditions] : {}) do
          scoped_methods << scoped_methods.last
        end
      end
    end

    def clear_default_scope
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
