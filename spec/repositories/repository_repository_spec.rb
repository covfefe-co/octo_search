# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RepositoryRepository do
  describe '::search' do
    let(:client_response) {
      [
        {
          'name' => 'foo',
          'html_url' => 'http://foo.bar',
          'description' => 'zoo',
          'language' => 'assembly',
          'stargazers_count' => 0,
          'owner' => {
            'login' => 'John Doe',
            'avatar_url' => 'http://zoo.bar',
            'url' => 'foo://bar.zoo'
          }
        }
      ]
    }

    subject { described_class.search(:foo) }

    before do
      allow(GithubAPI).to receive(:search).and_return(client_response)
    end

    it 'returns list of Repository objects' do
      expect(subject.length).to eql(1)
      expect(subject.first).to be_an_instance_of(Repository)
    end
  end
end
