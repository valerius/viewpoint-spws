require "bundler/gem_tasks"
require 'rake/testtask'
require 'rubygems'

desc "Clean the build environment"
task :clean do
    system "rm -f viewpoint*.gem"
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end


