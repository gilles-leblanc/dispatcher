require 'rubocop/rake_task'
require 'reek/rake/task'

desc 'Rubocop'
Rubocop::RakeTask.new(:rubocop) do |task|
  task.fail_on_error = false
end

desc 'Run Reek'
Reek::Rake::Task.new(:reek) do |t|
  t.fail_on_error = false
  t.verbose = true
  t.source_files = '*.rb'
end

desc 'Specs'
task :specs do
  system 'rspec -c'
end

desc 'All'
task :all => [:rubocop, :reek, :specs] do
end

task :default => :all
