# frozen_string_literal: true

require 'rspec'
require 'byebug'
require_relative '../../lib/log_parser/presenters/paths_presenter'

RSpec.describe PathsPresenter do
  describe '#print' do
    let(:presenter) { PathsPresenter.new(webpages_list, 'List of visited pages', 'desc') }
    it 'sorts the data and print it' do
      out_str = <<~HEREDOC
        List of visited pages
        routers: 89
        users: 21
        visitors: 12
        home/1: 2
      HEREDOC
      expect { presenter.print }.to output(out_str).to_stdout
    end
  end
end
