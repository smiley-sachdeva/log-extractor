# frozen_string_literal: true

require 'rspec'
require 'byebug'
require_relative '../../lib/log_parser/validators/file_validator'

class DummyClass
  include Validators::FileValidator

  def initialize(file)
    @file = file
  end
end

RSpec.describe Validators::FileValidator do
  describe '#valid?' do
    context 'given no file' do
      let(:file) { '' }
      let(:obj) { DummyClass.new(file) }

      it 'returns "File is empty"' do
        expect { obj.valid?('') }.to raise_error(Validators::FileValidator::FileError, 'Please pass the path to your file')
      end
    end

    context 'given an empty file' do
      let(:file) { 'test.log' }
      let(:obj) { DummyClass.new(file) }

      it 'returns "File is empty"' do
        expect { obj.valid?(file) }.to raise_error(Validators::FileValidator::FileError, 'File is empty')
      end
    end

    context 'given file does not exist at the path' do
      let(:file) { 'abc.log' }
      let(:obj) { DummyClass.new(file) }

      it 'returns "File does not exist"' do
        expect { obj.valid?(file) }.to raise_error(Validators::FileValidator::FileError, 'File does not exist at this path')
      end
    end
  end
end
