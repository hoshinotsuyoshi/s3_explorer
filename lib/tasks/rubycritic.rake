require 'rubycritic/rake_task'

Rubycritic::RakeTask.new do |task|
  # Name of RubyCritic task. Defaults to :rubycritic.
  # task.name    = 'something_special'

  # Glob pattern to match source files. Defaults to FileList['.'].
  task.paths   = FileList['app']

  # You can pass all the options here in that are shown by "rubycritic -h" except for
  # "-p / --path" since that is set separately. Defaults to ''.
  # task.options = '--mode-ci --format json'

  # Defaults to false
  # task.verbose = true
end
