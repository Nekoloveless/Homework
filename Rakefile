require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:full_test) do |task|
  task.pattern = 'spec/full_scenario_spec.rb'
end

task :default => :full_test