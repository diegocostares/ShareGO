require 'rails_helper'

RSpec.describe 'Errors', :realistic_error_responses, type: :request do
  describe 'GET /inexistent_page' do
    it 'returns http 404' do
      get '/inexistent_page'
      expect(response).to have_http_status(404)
    end
  end
end
