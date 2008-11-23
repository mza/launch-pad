module Turbo
  class Key
  
    @@settings = nil
    @@file = File.dirname(__FILE__) + "/../../config/aws.yml"
    
    def self.configuration=(location)
      @@file = location
    end
    
    def self.configuration
      @@file
    end
  
    def self.access
      settings['access_key_id']
    end
  
    def self.secret
      settings['secret_access_key']
    end
    
    private
  
    def self.settings
      if @@settings.nil?
        @@settings = load_settings
      end
      @@settings
    end
  
    def self.load_settings
      YAML.load(File.open("#{configuration}"))
    end
  
  end
end