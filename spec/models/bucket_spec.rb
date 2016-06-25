# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Bucket, type: :model do
  describe '#==' do
    context 'given same class object' do
      context 'given same name' do
        it 'returns true' do
          bucket = Bucket.new(name: 'a')
          other  = Bucket.new(name: 'a')
          expect(bucket == other).to be true
        end
      end

      context 'given different name' do
        it 'returns true' do
          bucket = Bucket.new(name: 'a')
          other  = Bucket.new(name: 'b')
          expect(bucket == other).to be false
        end
      end
    end

    context 'given different class object' do
      it 'returns false' do
        bucket = Bucket.new(name: 'a')
        other  = 'a'
        expect(bucket == other).to be false
      end
    end
  end
end
