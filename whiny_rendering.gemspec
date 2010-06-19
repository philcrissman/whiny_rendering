# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{whiny_rendering}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Phil Crissman"]
  s.date = %q{2010-06-18}
  s.description = %q{Add a helper that will be explicitly whiny about what templates and/or partials are being rendered.}
  s.email = %q{phil@betadeluxe.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/whiny_rendering.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/whiny_rendering.rb", "rails/init.rb", "Manifest", "whiny_rendering.gemspec"]
  s.homepage = %q{http://github.com/philcrissman/whiny_rendering}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Whiny_rendering", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{whiny_rendering}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Add a helper that will be explicitly whiny about what templates and/or partials are being rendered.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
