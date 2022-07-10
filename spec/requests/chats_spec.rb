require 'rails_helper'

RSpec.describe 'Chats', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/chats/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let!(:chat) { create(:chat) }
    it 'returns http success' do
      get "/chats/#{chat.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
