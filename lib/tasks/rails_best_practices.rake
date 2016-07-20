# frozen_string_literal: true

begin
  require 'rails_best_practices'
  desc 'Run RailsBestPractices'
  task :rails_best_practices do
    options = {}
    analyzer = RailsBestPractices::Analyzer.new(nil, options)
    analyzer.analyze
    analyzer.output
    exit analyzer.runner.errors.size
  end
rescue LoadError # rubocop:disable Lint/HandleExceptions
end
