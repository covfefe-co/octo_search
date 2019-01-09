# frozen_string_literal: true

class Owner
  attr_reader :login, :avatar_url, :url

  def initialize(login, avatar_url, url)
    @login = login
    @avatar_url = avatar_url
    @url = url
  end
end
