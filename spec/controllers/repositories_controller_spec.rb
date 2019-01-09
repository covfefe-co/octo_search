# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do

  describe 'GET index' do
    it 'is exptected respond with success' do
      get :index

      expect(response).to be_success
    end
  end

end
