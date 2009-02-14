$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'launch-pad/parser'
require 'launch-pad/command'
require 'launch-pad/command/haproxy'
require 'launch-pad/exception/undefined_registration_exception'

module LaunchPad
  VERSION = '0.2'
end