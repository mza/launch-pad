require "#{File.dirname(__FILE__)}/test_helper"

class HaproxyTest < Test::Unit::TestCase
  
  include LaunchPad
  
  def setup
    ActiveRecord::Base.establish_connection({
          :adapter => "sqlite3", 
          :dbfile => "#{File.dirname(__FILE__)}/db/test.sqlite"
    })
    
    Node.delete_all
    Node.create :name => "node_1.ec2.amazonaws.com", :role => "api"
    Node.create :name => "node_2.ec2.amazonaws.com", :role => "api"
    
  end
    
  def test_rebuild_config
    command = Haproxy.new(%q{register: haproxy})
    command.activate
    command.rebuild_config :with_templates => "#{File.dirname(__FILE__)}/files/", :to => "#{File.dirname(__FILE__)}/tmp/haproxy_test.conf"
    assert_file_equal "#{File.dirname(__FILE__)}/expected/haproxy.conf", "#{File.dirname(__FILE__)}/tmp/haproxy_test.conf"
  end
    
end