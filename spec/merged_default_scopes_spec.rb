require "spec_helper"

class SomeModel < ActiveRecord::Base
end

describe MergedDefaultScopes do
  before(:each) { SomeModel.__send__ :clear_default_scope }

  describe "#clear_default_scope" do
    it "clears scope" do
      SomeModel.class_eval do
        default_scope :order => :name
        default_scope :conditions => {:deleted_at => nil}
        clear_default_scope
      end
      SomeModel.__send__(:scope, :find).
        should be_nil
    end

    it "clears for new threads" do
      monitor = Monitor.new
      condition = monitor.new_cond
      counter = 0
      t1 = Thread.new do
        SomeModel.class_eval do
          default_scope :order => :name
        end
        counter += 1
      end

      t2 = Thread.new do
        monitor.synchronize do
          condition.wait_until { counter == 1 }
          SomeModel.class_eval do
            clear_default_scope
          end
          counter += 1
        end
      end

      t3 = Thread.new do
        monitor.synchronize do
          condition.wait_until { counter == 2 }
          SomeModel.__send__(:scope, :find).
            should be_nil
        end
      end
      [t1,t2,t3].each { |t| t.join }
    end
  end

  describe "#default_scope" do
    it "merges multiple calls" do
      SomeModel.class_eval do
        default_scope :conditions => {:deleted_at => nil}
        default_scope :order => :name
      end
      SomeModel.__send__(:scope, :find).
        should == {:order => :name, :conditions => {:deleted_at => nil}}
    end

    it "persists merges across threads" do
      monitor = Monitor.new
      condition = monitor.new_cond
      counter = 0
      t1 = Thread.new do
        SomeModel.class_eval do
          default_scope :order => :name
        end
        SomeModel.__send__(:scope, :find).
          should == {:order => :name}
        counter += 1
      end

      t2 = Thread.new do
        monitor.synchronize do
          condition.wait_until { counter == 1 }
          SomeModel.__send__(:scope, :find).
            should == {:order => :name}
        end
      end
      [t1,t2].each { |t| t.join }
    end
  end
end
