require 'rubygems'
require 'right_aws'
require 'turbo/key'

include Turbo

sqs = RightAws::SqsGen2.new(Key.access, Key.secret)
jobs = sqs.queue('jobqueue')

file = ARGV[0]

puts "Available messages: #{jobs.size}"

unless file.blank?
  puts "Posting: #{file}"
  jobs.send_message(file)
else
  puts "Nothing to post."
end