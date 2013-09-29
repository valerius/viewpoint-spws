require "bundler/gem_tasks"
require 'rake/testtask'
require 'rubygems'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc "Clean the build environment"
task :clean do
    system "rm -f viewpoint*.gem"
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end


