module LaunchPad
  class Parser

    require 'yaml'
    require 'active_support'

    include LaunchPad
    
    def self.parse(message)
      commands = nil
      
      incoming = YAML::load(message.to_s).symbolize_keys
      
      key = :register
      unless incoming[:unregister].nil?
        key = :unregister
      end
      
      begin
        command = "LaunchPad::#{incoming[key].camelize}".constantize.new(incoming)
      rescue NameError => exception
        raise UndefinedRegistrationException.new exception
      end
      
      command
    end
    
  end
end