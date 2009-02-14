require 'rubygems'
require 'right_aws'
require 'turbo/key'

include Turbo

sqs = RightAws::SqsGen2.new(Key.access, Key.secret)
jobs = sqs.queue('jobqueue')
messages = sqs.queue('eventqueue')
progress = sqs.queue('progressqueue')

puts "Genome alignment: queue monitor"
puts "-------------------------------"
puts ""
puts "Jobs pending: #{jobs.size}"
puts "Status updates: #{messages.size}"
puts "Progress updates: #{progress.size}"

if messages.size > 0
  for i in 0..messages.size
    message = messages.pop
    puts "Status update: #{message}"
  end
end

if progress.size > 0
  for i in 0..progress.size
    message = progress.pop
    puts "Progress update: #{message}"
  end
end
