# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
require "sdoc"
require "rdoc/task"

RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = "doc/"
  rdoc.options << "--format=sdoc"
  rdoc.options << "--exclude=test"
  rdoc.template = "rails"
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task default: :test
