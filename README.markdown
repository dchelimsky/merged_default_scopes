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
