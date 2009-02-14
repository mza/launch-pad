require 'rubygems'
require 'right_aws'
require 'turbo'

class Runner
  
  def self.run(name, key, secret)
    Turbo::Getter.from_s3 :bucket => "sanger_fastq", :named => name, :to => "/data/fastq/#{name}"
    result = `/usr/local/bin/ssaha2 -kmer 13 -skip 4 -seeds 4 -diff -1 -output cigar -disk 0 -score 45 -save /data/hashtable /data/fastq/#{name} > /data/results/#{name}.output`  
    result = `/bin/tar -zcf /data/zipped/#{name}.tar.gz /data/results/#{name}.output`
    s3 = RightAws::S3.new(key, secret)
    bucket = s3.bucket("sanger_alignment_results", true)
    key = RightAws::S3::Key.create(bucket, name)
    key.put name
  end
  
end

host = `hostname`

sqs = RightAws::SqsGen2.new(Turbo::Key.access, Turbo::Key.secret)

loop do
  
  jobs = sqs.queue('jobqueue')
  messages = sqs.queue('eventqueue')

  if jobs.size > 0
    message = jobs.pop
    
    unless message.blank?
      messages.send_message("Start: #{message} : #{host}")

      Runner.run(message.to_s, aws_access_key_id, aws_secret_access_key)

      messages.send_message("Complete: #{message} : #{host}")
    end
        
  end
  
  sleep 5

end
