require "spec_helper"

class SomeModel < ActiveRecord::Base; end

describe MergedDefaultScopes do
  after(:each) do
    SomeModel.__send__ :clear_default_scope
  end
  describe "#default_scope" do
    it "merges multiple calls" do
      SomeModel.__send__ :default_scope, :order => :name
      SomeModel.__send__ :default_scope, :conditions => {:deleted_at => nil}
      SomeModel.__send__(:scope, :find).
        should == {:order => :name, :conditions => {:deleted_at => nil}}
    end
  end

  describe "#clear_default_scope" do
    it "clears default scopes" do
      SomeModel.__send__ :default_scope, :order => :name
      SomeModel.__send__ :default_scope, :conditions => {:deleted_at => nil}
      SomeModel.__send__ :clear_default_scope
      SomeModel.__send__(:scope, :find).should be_nil
    end
  end
end
