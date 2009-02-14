module LaunchPad
  class Haproxy < Command
    
    def activate
      begin
        CreateHosts.migrate(:up)
      rescue ActiveRecord::StatementInvalid => e
        puts "Migration failed: #{e}"
      end
    end
    
  end
end