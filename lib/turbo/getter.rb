module Turbo
  class Getter
    
    include AWS::S3
    
    def self.from_s3(options)

      bucket_name = options[:bucket]
      object_name = options[:named]
      settings = {}

      settings[:access_key_id] = Turbo::Key.access
      settings[:secret_access_key] = Turbo::Key.secret

      file = ARGV[0]

      puts "Establishing connection to S3"
      Base.establish_connection!(
        :access_key_id     => settings[:access_key_id],
        :secret_access_key => settings[:secret_access_key]
      )

      bucket = Bucket.find(bucket_name)

      puts "Current bucket store: #{bucket.objects.size}"
      puts "Downloading: #{file}"
      open(options[:to], 'w') do |outfile|
        S3Object.stream(object_name, bucket_name) do |chunk|
          outfile.write chunk
        end
      end
    end
    
  end
end