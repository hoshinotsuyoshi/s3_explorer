# frozen_string_literal: true

# s3 bucket class.
class Bucket
  include ActiveModel::Model

  def self.all
    ENV['BUCKET_NAME_LIST'].to_s.split(',').map do |bucket_name|
      new(name: bucket_name)
    end
  end

  def self.find(name)
    all.find { |bucket| bucket.name == name }
  end

  def initialize(name:)
    @name = name
  end

  attr_reader :name

  def ==(other)
    if other.is_a? self.class
      name == other.name
    else
      super
    end
  end

  def to_param
    name
  end
end
