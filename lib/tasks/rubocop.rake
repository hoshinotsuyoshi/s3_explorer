# frozen_string_literal: true

if Rails.env.development? # workaround
  require 'rubocop'
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new
end
