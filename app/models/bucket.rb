# frozen_string_literal: true
class Bucket
  include ActiveModel::Model

  def self.all
    s3 = Aws::S3::Client.new
    s3.list_buckets.buckets.map { |b| new(name: b.name) }
  end

  def self.find(name)
    all.find { |b| b.name == name }
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
