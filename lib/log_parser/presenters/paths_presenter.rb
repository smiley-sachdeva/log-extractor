# frozen_string_literal: true

require 'byebug'
module Presenters
  # Present and Print the data Hashes by sorting them in asc/desc order
  module PathsPresenter
    attr_accessor :elements, :message, :order

    # Sorts the data and print it
    def print
      print_elements(sort)
    end

    private

    # sort the data in asc/desc order
    def sort
      elements.sort_by { |key, value| order.downcase == 'asc' ? value : -value }
    end

    # print the sorted data along with message title
    def print_elements(elements)
      puts message
      elements.each { |k1, v1| puts "#{k1}: #{v1}" }
    end
  end
  end
