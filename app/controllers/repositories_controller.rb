# frozen_string_literal: true

class RepositoriesController < ApplicationController

  def index
    if params[:search].present?
      @repositories = RepositoryRepository.search(params[:search])
    end
  end

end
