require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task["spec"].execute
end

task :console do
  sh "irb -rubygems -r intelipost"
end

task :default => :spec
