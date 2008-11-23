class KeyTest < Test::Unit::TestCase
  
  include Turbo
  
  def setup
    Key.configuration = File.dirname(__FILE__) + "/files/keys.yml"
  end
  
  def test_configuration_file
    assert_equal "./test/files/keys.yml", Key.configuration
  end
  
  def test_access_key
    assert_equal "your-access-key", Key.access
  end
  
  def test_secret_key
    assert_equal "your-secret-key", Key.secret
  end
  
end