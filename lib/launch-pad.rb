$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'launch-pad/parser'
require 'launch-pad/command'
require 'launch-pad/command/haproxy'
require 'launch-pad/command/host'
require 'launch-pad/exception/undefined_registration_exception'

require 'active_record'
require 'launch-pad/models/node'
require 'migrations/create_nodes'

module LaunchPad
  VERSION = '0.2'
end