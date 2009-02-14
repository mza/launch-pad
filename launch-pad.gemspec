# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{launch-pad}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Wood"]
  s.date = %q{2009-02-14}
  s.default_executable = %q{lp-monitor}
  s.email = ["matt.j.wood@gmail.com"]
  s.executables = ["lp-monitor"]
  s.extra_rdoc_files = ["Manifest.txt", "history.txt", "post_install.txt"]
  s.files = ["Manifest.txt", "README", "Rakefile", "bin/lp-monitor", "config/aws_default.yml", "examples/align_control.rb", "examples/dispatch.rb", "examples/monitor.rb", "examples/queue.rb", "examples/retrieve.rb", "examples/set.rb", "history.txt", "lib/launch-pad.rb", "lib/turbo.rb", "lib/turbo/getter.rb", "lib/turbo/key.rb", "lib/turbo/setter.rb", "post_install.txt", "script/console", "script/destroy", "script/generate", "test/files/keys.yml", "test/key_test.rb", "test/runner.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.post_install_message = %q{post_install.txt}
  s.rdoc_options = ["--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{launch-pad}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Something summary}
  s.test_files = ["test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.2.3"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end