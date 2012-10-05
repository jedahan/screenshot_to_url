require 'rake/testtask'

task :default => 'test'

Rake::TestTask.new(:test) do |t|
  t.libs << '.' << 'lib' << 'test'
  t.test_files = FileList['test/screenshot_to_url/**/*_test.rb']
  t.verbose = false
end
