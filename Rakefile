require 'rake/testtask'

Rake::TestTask.new do |test|
  test.pattern = 'test/**/*_test.rb'
  test.libs << 'test'
end


begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "refinerycms-forem"
    gem.summary = "Ruby on Rails forum engine for RefineryCMS"
    gem.description  = "A port of forem to  refinerycms"
    gem.email = "tim@uckun.com"
    gem.authors = ["Tim Uckun",  "Ryan Bigg"]
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{public}/**/*", "{config}/**/*"]
    gem.add_dependency    'refinerycms',  '>= 0.9.9'
    gem.add_dependency   'simple_form'
  end
  Jeweler::GemcutterTasks.new
rescue
  puts "Jeweler or dependency not available."
end
