# frozen_string_literal: true

class GithubAPI
  API_URL = 'https://api.github.com/search/repositories'
  HEADERS = { 'Accept' => 'application/json', 'User-Agent' => 'octo_search' }.freeze

  class << self
    def search(query)
      response = HTTParty.get(API_URL, query: { q: query }, headers: HEADERS)

      response.success? ? JSON.parse(response)['items'] : []
    end
  end

end
