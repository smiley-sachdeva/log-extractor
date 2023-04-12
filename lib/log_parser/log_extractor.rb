# frozen_string_literal: true

require 'set'

# Extracts the data from logs file
#   Example :-
#   file = LogExtractor.new(file)
#   file.extract => {visited: {'home/1' => 2, 'users' => 10}, unique: {'home/1' => 1, 'users' => 5}}
#
class LogExtractor
  def initialize(file)
    @file = file
    @visited = {}
    @unique = Hash.new { |hash, key| hash[key] = Set.new }
  end

  def extract
    content.split("\n").each do |line|
      path_and_ip = line.split(' ')
      get_visited_paths(path_and_ip)
      get_unique_paths(path_and_ip)
    end
    { visited: elements_count(visited), unique: elements_count(unique) }
  end

  private

  def content
    File.read(file)
  end

  def elements_count(element_hash)
    element_hash.each { |k1, v1| element_hash[k1] = v1.size }
  end

  def get_visited_paths(path_and_ip)
    visited[path_and_ip.first] = [] unless visited.key?(path_and_ip.first)
    visited[path_and_ip.first] << path_and_ip.last
  end

  def get_unique_paths(path_and_ip)
    unique[path_and_ip.first] << path_and_ip.last
  end

  attr_reader :file, :visited, :unique
end
