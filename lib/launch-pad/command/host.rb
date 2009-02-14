module LaunchPad
  class Host < Command
    
    def activate
      response = true
      
      if !options[:register].nil?
        puts "New host: #{options[:name]}"
        node = Node.new :name => options[:name], :role => options[:role]
        response = node.save      
      elsif !options[:unregister].nil?
        puts "Unregistering host: #{options[:name]}"
        node = Node.find_by_name options[:name]
        unless node.nil?
          response = node.delete
        end
      end
      
      response
    end
    
    def invalidates_config?
      true
    end
        
  end
end