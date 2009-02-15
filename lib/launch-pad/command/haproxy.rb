require 'erb'

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
      to = options[:to]
      puts "Rebuilding Haproxy config with: #{location}"
      template = ERB.new File.read("#{location}/haproxy.erb")
      result = template.result(binding)
      File.open("#{to}/haproxy.conf", 'w') do |f|
        f.write result
      end
      puts "Config file saved - restarting haproxy"
      `killall haproxy`
      `haproxy -f #{to}/haproxy.conf`
    end
    
    def servers_for(role, options = {})
      response = ""
      Node.all.each_with_index do |node,index|
        response = response + "server  #{role}_#{options[:type]}_#{index} #{node.name} cookie app1inst1 check inter 2000 rise 2 fall 5\n"
      end
      response
    end
        
  end
end