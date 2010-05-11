require "spec_helper"

class SomeModel < ActiveRecord::Base
  def initialize
    @columns = []
  end
  
  def self.columns
    @columns ||= [];
  end
  
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  column :deleted_at, :datetime
  column :name, :string
end

describe MergedDefaultScopes do
  describe "#default_scope" do
    before(:each) do
      SomeModel.__send__ :default_scope, :order => :name
      SomeModel.__send__ :default_scope, :conditions => {:deleted_at => nil}
    end
    it "does not append scope" do
      SomeModel.__send__(:default_scoping).length.should == 1
    end

    it "merges multiple calls" do
      SomeModel.__send__(:default_scoping)[0][:find].
        should == {:order => :name, :conditions => {:deleted_at => nil}}
    end
  end
end

