#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative './lib/log_parser/log_parser'
require_relative './lib/log_parser/log_extractor'

extractor = LogExtractor.new(ARGV[0])

LogParser.new(ARGV[0]).parse(extractor)
