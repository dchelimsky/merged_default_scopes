require "spec_helper"

class SomeModel < ActiveRecord::Base
end

describe MergedDefaultScopes do
  before(:each) { SomeModel.__send__ :clear_default_scope }

  describe "#default_scope" do
    it "merges multiple calls" do
      SomeModel.class_eval do
        default_scope :conditions => {:deleted_at => nil}
        default_scope :order => :name
      end
      SomeModel.__send__(:scope, :find).
        should == {:order => :name, :conditions => {:deleted_at => nil}}
    end
  end

  describe "#clear_default_scope" do
    it "clears default scopes" do
      SomeModel.class_eval do
        default_scope :order => :name
        default_scope :conditions => {:deleted_at => nil}
        clear_default_scope
      end
      SomeModel.__send__(:scope, :find).should be_nil
    end
  end

end
