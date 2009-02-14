require "#{File.dirname(__FILE__)}/test_helper"

class ParserTest < Test::Unit::TestCase
  
  include LaunchPad
    
  def test_yaml
    message = %q{
      register: haproxy
    }
    command = Parser.parse(message)
    assert_kind_of Haproxy, command
  end
  
  def test_exception
    
    message = %q{
      register: nonsense
    }
    
    assert_raise UndefinedRegistrationException do
      command = Parser.parse(message)      
    end
    
  end
  
end