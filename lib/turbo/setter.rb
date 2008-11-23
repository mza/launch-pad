module Turbo
  class Setter
    
    include AWS::S3

    def self.to_s3(options)

      bucket_name = options[:bucket]
      file = options[:from]
      object_name = options[:named]
      
      settings = {}

      settings[:access_key_id] = Turbo::Key.access
      settings[:secret_access_key] = Turbo::Key.secret

      puts "Establishing connection to S3"
      Base.establish_connection!(
        :access_key_id     => settings[:access_key_id],
        :secret_access_key => settings[:secret_access_key]
      )

      begin
        bucket = Bucket.find(bucket_name)
      rescue NoSuchBucket
        bucket = Bucket.create(bucket_name)
      end

      bucket = Bucket.find(bucket_name)

      puts "Current bucket store: #{bucket.objects.size}"
      puts "Uploading: #{file} as #{object_name}"
      S3Object.store(object_name, open(file), bucket_name)
    end
  
  end
end
