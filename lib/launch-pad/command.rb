module LaunchPad
  class Command
    
    attr_accessor :options
    
    def initialize(incoming)
      self.options = incoming
    end
    
    def activate
      puts "Executing: #{self.class}"
    end    
    
    def sets_activity?
      false
    end
    
    def invalidates_config?
      false
    end
    
  end
end