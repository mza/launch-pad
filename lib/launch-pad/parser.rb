module LaunchPad
  class Parser

    require 'yaml'
    require 'active_support'

    include LaunchPad
    
    def self.parse(message)
      commands = nil
      
      incoming = YAML::load(message.to_s).symbolize_keys
            
      begin
        command = "LaunchPad::#{incoming[:register].camelize}".constantize.new
      rescue NameError => exception
        raise UndefinedRegistrationException.new exception
      end
      
      command
    end
    
  end
end