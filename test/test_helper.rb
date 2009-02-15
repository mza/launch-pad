require 'test/unit'
require File.dirname(__FILE__) + '/../lib/turbo'
require File.dirname(__FILE__) + '/../lib/launch-pad'

module Test
  module Unit 
    class TestCase
      
      def assert_file_equal(file1, file2)
        file1_contents = File.new(file1).read
        file2_contents = File.new(file2).read
        assert_equal file1_contents, file2_contents
      end
      
    end
  end
end