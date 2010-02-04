require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "wp-generate"
    gem.summary = %Q{script/generate for WordPress}
    gem.description = %Q{}
    gem.email = "tom@thedextrousweb.com"
    gem.homepage = "http://github.com/dxw/wp-generate"
    gem.authors = ["The Dextrous Web"]
    gem.add_runtime_dependency "activesupport"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
desc "Run all specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.ruby_opts = %w[-rubygems]
end

require 'spec/rake/spectask'
desc "Coverage"
Spec::Rake::SpecTask.new(:rcov) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = true
  t.ruby_opts = %w[-rubygems]
  t.rcov_opts = %w[--exclude ^/,spec]
end
