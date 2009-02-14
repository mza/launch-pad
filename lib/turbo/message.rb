module Turbo
  class Message
    
    attr_accessor :content, :queue
    
    def initialize(options)
      self.content = options[:with]
    end
    
    def clear
      self.content.delete
    end

    def to_s
      self.content.to_s
    end
    
    def to_yaml
      self.content.to_yaml
    end
    
  end
end