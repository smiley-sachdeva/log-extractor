# frozen_string_literal: true

module Validators
  # Validates Whether the file is empty or does not exist at specified path
  #    Examples :-
  #
  #   class Test
  #     include Validators::FileValidator
  #
  #     def initialize(file)
  #       @file = file
  #     end
  #
  #     def parse
  #       valid?(file)
  #     end
  #   end
  #    test = Test.new.parse('webserver.log')
  #    valid? #=> true
  #
  #    test = Test.new.parse('aa.log')
  #    valid? #=> Exception -> Validators::FileValidator::FileError, 'File does not exist'
  module FileValidator
    class FileError < StandardError; end

    def valid?(file)
      raise FileError, 'Please pass the path to your file' if file.nil? || file.empty?
      raise FileError, 'File does not exist at this path' unless File.exists? file
      raise FileError, 'File is empty' if File.empty? file

      true
    end
  end
end

