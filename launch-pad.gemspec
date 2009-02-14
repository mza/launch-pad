Gem::Specification.new do |s|
   s.name = %q{launch-pad}
   s.version = "0.1"
   s.date = %q{2009-02-14}
   s.authors = ["Matt Wood"]
   s.email = %q{matt.j.wood@gmail.com}
   s.summary = %q{A set of simple scripts for launching tasks, using Amazon Web Services}
   s.homepage = %q{http://www.greenisgood.org/}
   s.description = %q{A set of simple scripts for launching tasks, using Amazon Web Services}
   
   files = [ "Rakefile", "README" ]
   directories = [ "bin", "config", "doc", "lib", "lib/turbo", "test" ]
   
   directories.each do |directory|
     Dir.new(directory).entries.each do |entry|
       unless [ ".", "..", ".svn" ].include? entry
         files << "#{directory}/#{entry}"
       end
     end
   end
   
   for file in files
     puts file
   end
   
   s.files = files
end