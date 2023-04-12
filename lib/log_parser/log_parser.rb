# frozen_string_literal: true

require_relative 'validators/file_validator'
require_relative 'presenters/paths_presenter'
require 'byebug'

#  Parse the file and will return
# * <tt>Visited paths </tt> Number of times paths has been visited from all IP's
# * <tt>Unique paths</tt> Number of times paths has been visited from unique IP's
class LogParser
  include Validators::FileValidator
  include Presenters::PathsPresenter

  def initialize(file_path)
    @file_path = file_path
    @order = 'desc'
  end

  # Validates, extracts and prints the data
  def parse(extractor)
    print_data(extractor.extract) if valid?(file_path)
  rescue Validators::FileValidator::FileError => e
    p e.message
  end

  private

  def print_data(data)
    data.each do |group, value|
      self.elements = value
      self.message = send(group.to_sym)
      self.order = order
      print
    end
  end

  # Message title for visited IP's
  def visited
    'List of webpages visited by number of IPs'
  end

  # Message Title for Unique IP's
  def unique
    'List of webpages visited by unique IPs'
  end

  attr_reader :file_path, :order
end
