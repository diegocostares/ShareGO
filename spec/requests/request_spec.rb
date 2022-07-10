require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  let!(:requestee) { create(:user) }
  let!(:publication) { create(:publication, user: requestee) }
  let!(:requester) { create(:user) }
  let!(:request) { create(:request, publication: publication, user: requester) }

  describe 'GET /index' do
    it 'returns http success' do
      get '/requests/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /approve' do
    it 'approves request' do
      login_as requestee
      patch "/requests/#{request.id}/approve"
      # Redirect to the index page
      expect(response).to have_http_status(:redirect)
      # Check that the request is approved
      expect(request.reload.status).to eq('approved')
    end
  end

  describe 'PATCH /reject' do
    it 'rejects request' do
      login_as requestee
      patch "/requests/#{request.id}/reject"
      # Redirect to the index page
      expect(response).to have_http_status(:redirect)
      # Changes request status
      expect(request.reload.status).to eq('rejected')
    end
  end

  # Create a new request
  describe 'POST /create' do
    it 'creates a new pending request' do
      new_publication = create(:publication, user: requestee)

      login_as requester
      post '/requests/', params: { request: { publication_id: new_publication.id } }

      expect(response).to have_http_status(:redirect)
      expect(Request.find_by(user_id: requester.id, publication_id: new_publication.id).status).to eq('pending')
    end
  end

  # Destroy (rescind) a request
  describe 'DELETE /destroy' do
    it 'destroys request' do
      login_as requester
      delete "/requests/#{request.id}"
      # Redirect to the index page
      expect(response).to have_http_status(:redirect)
      # Check that the request is destroyed
      expect(Request.find_by(id: request.id)).to be_nil
    end
  end
end
