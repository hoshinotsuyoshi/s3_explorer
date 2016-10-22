# frozen_string_literal: true

begin
  require 'rubycritic/rake_task'
  RubyCritic::RakeTask.new do |task|
    task.paths = FileList['app', 'lib']
  end
rescue LoadError # rubocop:disable Lint/HandleExceptions
end
