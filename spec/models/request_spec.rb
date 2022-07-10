require 'rails_helper'

RSpec.describe Request, type: :model do
  let!(:requestee) { create(:user) }
  let!(:publication) { create(:publication, user: requestee) }
  let!(:requester) { create(:user) }

  describe '#create' do
    context 'with valid attributes' do
      it 'creates a new request' do
        expect do
          create(:request, user: requester, publication: publication)
        end.to change(Request, :count).by(1)
      end
    end
  end

  # Approve
  describe '#approve' do
    context 'with valid attributes' do
      it 'changes the status to approved' do
        request = create(:request, user: requester, publication: publication)
        request.approve
        expect(request.status).to eq('approved')
      end
    end
    # Check that approval results in less seats
    context 'with valid attributes' do
      it 'changes the number of seats in publication' do
        request = create(:request, user: requester, publication: publication)
        expect do
          request.approve
        end.to change(publication, :seats_left).by(-1)
      end
    end
  end

  # Reject
  describe '#reject' do
    context 'with valid attributes' do
      it 'changes the status to rejected' do
        request = create(:request, user: requester, publication: publication)
        request.reject
        expect(request.status).to eq('rejected')
      end
    end
  end

  # Destroy
  describe '#destroy' do
    context 'with valid attributes' do
      it 'destroys the request' do
        request = create(:request, user: requester, publication: publication)
        expect do
          request.destroy
        end.to change(Request, :count).by(-1)
      end
    end
  end
end
