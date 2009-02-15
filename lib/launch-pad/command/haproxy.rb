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
    
    def rebuild_config(options = {})
      location = options[:with_templates]
      puts "Rebuilding Haproxy config with: #{location}"
      nodes = Node.all
      puts "Registered nodes: #{nodes.size}"      
    end
        
  end
end