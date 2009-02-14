module Turbo
  class Queue
    
    attr_accessor :name, :queue
        
    def initialize(queue_name)
      self.name = queue_name
      self.queue = find_or_create(queue_name)
    end

    def send(message)
      self.queue.send_message(message)
    end
    
    def messages
      all_messages = []
      self.queue.receive_messages.each do |message|
        all_messages << Turbo::Message.new(:with => message)
      end
      all_messages
    end
    
    def messages?
      self.queue.size == 0 ? false : true
    end
    
    private
    
      def sqs
        RightAws::SqsGen2.new(Key.access, Key.secret)
      end
      
      def find_or_create(queue_name)
        RightAws::SqsGen2::Queue.create(sqs, queue_name, true)
      end
    
  end
end