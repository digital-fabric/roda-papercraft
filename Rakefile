# frozen_string_literal: true

task :default => :test
task :test do
  exec 'ruby test/run.rb'
end

task :release do
  require_relative './lib/roda_papercraft_version'
  version = RODA_PAPERCRAFT_VERSION

  puts 'Building roda-papercraft...'
  `gem build roda-papercraft.gemspec`

  puts "Pushing roda-papercraft #{version}..."
  `gem push roda-papercraft-#{version}.gem`

  puts "Cleaning up..."
  `rm *.gem`
end
