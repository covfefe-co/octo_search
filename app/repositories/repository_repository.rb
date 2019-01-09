# frozen_string_literal: true

# What a nice naming
class RepositoryRepository

  class << self
    def search(query)
      result = GithubAPI.search(query)
      result.map { |repo_data| build_repository(repo_data) }
    end

    private
      # These mappings could be done in Mapper/Factory class.
      def build_repository(repository_data)
        owner = build_owner(repository_data["owner"])

        Repository.new(
          owner,
          repository_data["name"],
          repository_data["html_url"],
          repository_data["description"],
          repository_data["language"],
          repository_data["stargazers_count"],
        )
      end

      def build_owner(owner_data)
        Owner.new(
          owner_data["login"],
          owner_data["avatar_url"],
          owner_data["url"]
        )
      end

  end

end
