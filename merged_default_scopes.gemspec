# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merged_default_scopes}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Chelimsky", "Brian Tatnall"]
  s.date = %q{2010-05-16}
  s.description = %q{modify behavior of ActiveRecord::Base::default_scope to merge rather than overwrite}
  s.email = %q{dchelimsky@gmail.com,btatnall@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitconfig",
     ".gitignore",
     ".rspec",
     "Gemfile",
     "History.markdown",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "autotest/discover.rb",
     "lib/merged_default_scopes.rb",
     "merged_default_scopes.gemspec",
     "spec/db/schema.rb",
     "spec/merged_default_scopes_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/dchelimsky/merged_default_scopes}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{the name says it all}
  s.test_files = [
    "spec/db/schema.rb",
     "spec/merged_default_scopes_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.0.0.beta.8"])
    else
      s.add_dependency(%q<rspec>, [">= 2.0.0.beta.8"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.0.0.beta.8"])
  end
end

