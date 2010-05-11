require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "merged_default_scopes"
    gem.summary = %Q{the name says it all}
    gem.description = %Q{modify behavior of default_scope method to merge rather than override}
    gem.email = "dchelimsky@gmail.com,btatnall@gmail.com"
    gem.homepage = "http://github.com/dchelimsky/merged_default_scopes"
    gem.authors = ["David Chelimsky", "Brian Tatnall"]
    gem.add_development_dependency "rspec", ">= 2.0.0.beta.8"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rspec/core/rake_task'
Rspec::Core::RakeTask.new(:spec)

Rspec::Core::RakeTask.new(:rcov) do |spec|
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "merged_default_scopes #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
