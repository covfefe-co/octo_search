# frozen_string_literal: true

class Repository
  attr_reader :owner, :name, :url, :description, :language, :star_count

  def initialize(owner, name, url, description, language, star_count)
    @owner = owner
    @name = name
    @url = url
    @description = description
    @language = language
    @star_count = star_count
  end
end
