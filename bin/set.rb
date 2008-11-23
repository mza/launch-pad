require 'turbo'

Turbo::Setter.to_s3 :bucket => "sanger_alignments", :named => "example", :from => "/etc/passwd"
