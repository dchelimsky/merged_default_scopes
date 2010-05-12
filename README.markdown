# merged\_default\_scopes

    module SomeSoftDeletablePlugin
      def self.included(mod)
        mod.default_scope :conditions => {:deleted_at => nil}
      end
    end
    
    class SomeModel < ActiveRecord::Base
      include SomeSoftDeletablePlugin # that may or may not be setting a default_scope

      default_scope :order => :name
    end

    # default_scope => {:find => {:order => :name, :conditions => {:deleted_at => nil}}}
    #
    # ... and all is right with the world

## Install

    $ gem install merged_default_scopes

## Configure

    require 'merged_default_scopes'
    # attaches itself to ActiveRecord::Base
    
## Contribute
 
* Fork the project on github.
* Make the code better with a new feature, bug fix, or refactoring.
  * New features and bug fixes should have specs.
* Send us a pull request.

## Copyright

Copyright (c) 2010 David Chelimsky and Brian Tatnall. See LICENSE for details.
