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

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 David Chelimsky and Brain Tatnall. See LICENSE for details.
