# frozen_string_literal: true
require 'ostruct'

shared_examples_for 'overridden equalness' do |method:|
  describe '#==' do
    context 'given same class object' do
      context "given same #{method}" do
        it 'returns true' do
          me = described_class.new(OpenStruct.new(method => 'a'))
          other = described_class.new(OpenStruct.new(method => 'a'))
          expect(me == other).to be true
        end
      end

      context "given different #{method}" do
        it 'returns false' do
          me = described_class.new(OpenStruct.new(method => 'a'))
          other = described_class.new(OpenStruct.new(method => 'b'))
          expect(me == other).to be false
        end
      end
    end

    context 'given different class object' do
      it 'returns false' do
        me = described_class.new(OpenStruct.new(method => 'a'))
        other = 'a'
        expect(me == other).to be false
      end
    end
  end
end
