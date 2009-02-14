module LaunchPad
  class Parser

    require 'yaml'
    require 'active_support'

    include LaunchPad
    
    def self.parse(message)
      command = nil
      puts "Incoming: #{message}"
      incoming = YAML::load(message).symbolize_keys
      puts "Registering: #{incoming[:register]}"
      begin
        command = "LaunchPad::#{incoming[:register].camelize}".constantize.new
      rescue NameError => exception
        raise UndefinedRegistrationException.new exception
      end
      
      command
    end
    
  end
end