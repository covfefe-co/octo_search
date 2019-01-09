# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GithubAPI do
  describe '::search' do
    subject { described_class.search('tetris') }

    context 'when API call succeeds' do
      let(:expected_result) {
        [
          {
            'name' => 'Tetris'
          }
        ]
      }

      before do
        stub_request(:get, 'https://api.github.com/search/repositories?q=tetris')
          .with(headers: { 'Accept' => 'application/json', 'User-Agent' => 'octo_search' })
          .to_return(status: 200, body: { items: expected_result }.to_json, headers: {})
      end

      it 'returns the result items' do
        expect(subject).to eql(expected_result)
      end
    end

    context 'when API call fails' do
      before do
        stub_request(:get, 'https://api.github.com/search/repositories?q=tetris')
          .with(headers: { 'Accept' => 'application/json', 'User-Agent' => 'octo_search' })
          .to_return(status: 429, body: '', headers: {})
      end

      it 'returns and empty array' do
        expect(subject).to eql([])
      end
    end
  end
end
