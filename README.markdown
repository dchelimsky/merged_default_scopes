# merged\_default\_scopes

    require 'merged_default_scopes' 
    
    module SomePlugin
      def self.included(mod)
        mod.default_scope :conditions => {:deleted_at => nil}
      end
    end
    
    class SomeModel < ActiveRecord::Base
      include SomePlugin

      default_scope :order => :name
    end
    
    SomeModel.__send__(:scope, :find)
    # => {:order => :name, :conditions => {:deleted_at => nil}}
    #
    # ... and all is right with the world

# clear\_default\_scope

    require 'merged_default_scopes' 
    
    class SomeModel < ActiveRecord::Base
      include SomePluginThatMightSetDefaultScope
      include AnotherPluginThatMightSetDefaultScope

      clear_default_scope
      default_scope :order => :name
    end
    
    SomeModel.__send__(:scope, :find)
    # => {:order => :name}
    #
    # ... and all is right with the world, assuming you want the old
    # behaviour of default_scope, which is to overwrite previously set
    # default scopes

## Motivation

Sometimes plugins use `default_scope` to do what they do. We need a means of adding to
the default scope without blowing it away.

This is going to be the behaviour of default_scope and clear_default_scope in
rails-3 (as of http://github.com/rails/rails/commit/35a114a8941cb22d29a536f1215a23a8cf7c4756),
so this gem serves as a back-port to rails-2.

## Install

    $ gem install merged_default_scopes

## Contribute
 
* [Fork the project](http://github.com/dchelimsky/merged_default_scopes)
* Make the code better with a new feature, bug fix, or refactoring.
  * New features and bug fixes should have specs.
* Send us a pull request.

## Learn more

* [code/docs](http://github.com/dchelimsky/merged_default_scopes)
* [issues](http://github.com/dchelimsky/merged_default_scopes/issues)

## Copyright

Copyright (c) 2010 David Chelimsky and Brian Tatnall. See LICENSE for details.
