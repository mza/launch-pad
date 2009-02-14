require 'rubygems'
require 'right_aws'
require 'turbo'

include Turbo

sqs = RightAws::SqsGen2.new(Key.access, Key.secret)

host = "ec2-67-202-19-202.compute-1.amazonaws.com"
message = "SRR002677.over60.fastq.02"

messages = sqs.queue('eventqueue')

# messages.send_message("Start: #{message} : #{host}")
messages.send_message("Complete: #{message} : #{host}")

# messages = sqs.queue('progressqueue')
# messages.send_message("Update: Thu Nov 13 14:18:57 UTC 2008\n10434\n : ec2-67-202-19-202.compute-1.amazonaws.com")
