# frozen_string_literal: true
require 'rubycritic/rake_task'

Rubycritic::RakeTask.new do |task|
  task.paths = FileList['app']
end
