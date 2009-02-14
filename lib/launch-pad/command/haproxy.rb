module LaunchPad
  class Haproxy < Command
    
    def activate(options = {})
      begin
        CreateNodes.migrate(:up)
      rescue ActiveRecord::StatementInvalid => e
        puts "Migration failed: #{e}"
      end
    end
    
    def sets_activity?
      true
    end
        
  end
end