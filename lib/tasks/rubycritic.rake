# frozen_string_literal: true

if Rails.env.development? # workaround
  require 'rubycritic/rake_task'

  Rubycritic::RakeTask.new do |task|
    task.paths = FileList['app', 'lib']
  end
end
